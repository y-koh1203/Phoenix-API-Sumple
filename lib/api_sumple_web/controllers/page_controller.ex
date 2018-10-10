defmodule ApiSumpleWeb.PageController do
  use ApiSumpleWeb, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
