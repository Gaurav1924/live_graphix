defmodule LiveGraphixWeb.GraphLive do
  use Phoenix.LiveView
  alias LiveGraphix.Graph
  alias LiveGraphixWeb.FlowComponent

  def mount(_params, _session, socket) do
    # Subscribe to the channel to receive updates
    LiveGraphixWeb.Endpoint.subscribe("graph:lobby")
    {:ok, assign(socket, graphs: Graph.list_graphs())}
  end

  def render(assigns) do
    ~H"""
    <div>
      <h1>Graphs</h1>
      <ul>
        <%= for graph <- @graphs do %>
          <li><%= graph["name"] %>: <%= graph["nodes"] %> nodes, <%= graph["edges"] %> edges</li>
        <% end %>
      </ul>
      <%= live_component FlowComponent, id: "flow" %>
      <script>
        import { Socket } from "phoenix"
        import { LiveSocket } from "phoenix_live_view"

        const socket = new Socket("/socket", {params: {_csrf_token: document.querySelector("meta[name='csrf-token']").getAttribute("content")} });
        socket.connect();

        const channel = socket.channel("graph:lobby", {});
        channel.join()
          .receive("ok", () => console.log("Joined graph:lobby channel"))
          .receive("error", (reason) => console.error("Failed to join channel", reason));

        // JavaScript hook to handle real-time updates
        const Hooks = {
          NodeMove: {
            mounted() {
              this.handleEvent("node_moved", ({ node_id, position }) => {
                let nodeElement = document.getElementById(`node_${node_id}`);
                if (nodeElement) {
                  nodeElement.style.left = `${position.x}px`;
                  nodeElement.style.top = `${position.y}px`;
                }
              });

              this.el.addEventListener("dragend", (event) => {
                let nodeId = this.el.dataset.id;
                let position = { x: event.pageX, y: event.pageY };
                channel.push("move_node", { node_id: nodeId, position: position });
              });
            }
          }
        }

        const liveSocket = new LiveSocket("/live", Socket, { hooks: Hooks });
        liveSocket.connect();

        window.liveSocket = liveSocket;
      </script>
    </div>
    """
  end

  def handle_info(%{event: "node_moved", payload: %{"node_id" => node_id, "position" => position}}, socket) do
    # Update the graphs data to reflect the moved node
    graphs = update_node_position(socket.assigns.graphs, node_id, position)
    {:noreply, assign(socket, graphs: graphs)}
  end

  defp update_node_position(graphs, node_id, new_position) do
    Enum.map(graphs, fn
      %{"nodes" => nodes} = graph ->
        updated_nodes = Enum.map(nodes, fn
          %{"id" => ^node_id} = node -> Map.put(node, "position", new_position)
          node -> node
        end)
        Map.put(graph, "nodes", updated_nodes)
      graph -> graph
    end)
  end
end
