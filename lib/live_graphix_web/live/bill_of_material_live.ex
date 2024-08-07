defmodule LiveGraphixWeb.BillOfMaterialLive do
  use Phoenix.LiveView
  alias LiveGraphix.BillOfMaterials

  def render(assigns) do
    LiveGraphixWeb.BillOfMaterialView.render("index.html", assigns)
  end

  def mount(_params, _session, socket) do
    {:ok, assign(socket, :items, BillOfMaterials.list_items())}
  end
end
