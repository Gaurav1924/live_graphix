defmodule LiveGraphixWeb.FlowComponent do
  use LiveGraphixWeb, :live_component

  def render(assigns) do
    ~H"""
    <div id="flow-component" phx-hook="VueFlow">
      <!-- VueFlow component will be rendered here -->
    </div>
    """
  end
end
