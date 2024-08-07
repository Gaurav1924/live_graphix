defmodule LiveGraphixWeb.BillOfMaterialLiveTest do
  use LiveGraphixWeb.ConnCase

  test "renders the bill of materials page", %{conn: conn} do
    {:ok, view, html} = live(conn, "/bill_of_material")
    assert html =~ "Bill of Materials"
  end
end
