defmodule LiveGraphixWeb.GraphChannel do
  use Phoenix.Channel

  def join("graph:lobby", _message, socket) do
    {:ok, socket}
  end

  def handle_in("move_node", %{"node_id" => node_id, "position" => position}, socket) do
    broadcast!(socket, "node_moved", %{"node_id" => node_id, "position" => position})
    {:noreply, socket}
  end
end
