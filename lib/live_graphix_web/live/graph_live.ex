defmodule LiveGraphixWeb.Live.GraphLive do
  use Phoenix.LiveView

  alias LiveGraphix.Graph
  alias LiveGraphixWeb.FlowComponent

  def mount(_params, _session, socket) do
    {:ok, assign(socket, :graphs, Graph.list_graphs())}
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
    </div>
    """
  end
end
