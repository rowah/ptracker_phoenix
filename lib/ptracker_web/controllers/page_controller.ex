defmodule PtrackerWeb.PageController do
  use PtrackerWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
