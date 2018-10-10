defmodule ApiSumpleWeb.SumpleController do
  use ApiSumpleWeb, :controller

  alias ApiSumple.Api
  alias ApiSumple.Api.Sumple

  action_fallback ApiSumpleWeb.FallbackController

  def index(conn, _params) do
    sumple = Api.list_sumple()
    render(conn, "index.json", sumple: sumple)
  end

  def create(conn, %{"sumple" => sumple_params}) do
    with {:ok, %Sumple{} = sumple} <- Api.create_sumple(sumple_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", sumple_path(conn, :show, sumple))
      |> render("show.json", sumple: sumple)
    end
  end

  def show(conn, %{"id" => id}) do
    sumple = Api.get_sumple!(id)
    render(conn, "show.json", sumple: sumple)
  end

  def update(conn, %{"id" => id, "sumple" => sumple_params}) do
    sumple = Api.get_sumple!(id)

    with {:ok, %Sumple{} = sumple} <- Api.update_sumple(sumple, sumple_params) do
      render(conn, "show.json", sumple: sumple)
    end
  end

  def delete(conn, %{"id" => id}) do
    sumple = Api.get_sumple!(id)
    with {:ok, %Sumple{}} <- Api.delete_sumple(sumple) do
      send_resp(conn, :no_content, "")
    end
  end
end
