defmodule LiveGraphixWeb.GraphView do
  use LiveGraphixWeb, :view

  def render("index.html", assigns) do
    ~H"""
    <div>
      <h1>Graphs</h1>
      <ul>
        <%= for graph <- @graphs do %>
          <li><%= graph["name"] %>: <%= graph["nodes"] %> nodes, <%= graph["edges"] %> edges</li>
        <% end %>
      </ul>
    </div>
    """
  end
end
