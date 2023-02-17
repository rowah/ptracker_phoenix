defmodule PtrackerWeb.PageControllerTest do
  use PtrackerWeb.ConnCase

  test "GET /", %{conn: conn} do
    conn = get(conn, "/")
    assert html_response(conn, 200) =~ "Welcome to PTracker!"
  end
end
