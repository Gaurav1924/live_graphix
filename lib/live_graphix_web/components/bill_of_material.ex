defmodule LiveGraphixWeb.BillOfMaterialView do
  use LiveGraphixWeb, :view

  def render("index.html", assigns) do
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
