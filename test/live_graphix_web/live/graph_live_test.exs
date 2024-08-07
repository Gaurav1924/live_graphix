defmodule LiveGraphixWeb.GraphLiveTest do
  use LiveGraphixWeb.ConnCase

  test "renders the graph page", %{conn: conn} do
    {:ok, view, html} = live(conn, "/graph")
    assert html =~ "Graph Page"
  end
end
