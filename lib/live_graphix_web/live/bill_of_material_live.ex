defmodule LiveGraphixWeb.BillOfMaterialLive do
  use Phoenix.LiveView
  alias LiveGraphix.BillOfMaterials

  def mount(_params, _session, socket) do
    {:ok, assign(socket, :items, BillOfMaterials.list_items())}
  end

  def render(assigns) do
    ~H"""
    <div>
      <h1>Bill of Materials</h1>
      <ul>
        <%= for item <- @items do %>
          <li><%= item["name"] %>: <%= item["quantity"] %></li>
        <% end %>
      </ul>
    </div>
    """
  end
end
