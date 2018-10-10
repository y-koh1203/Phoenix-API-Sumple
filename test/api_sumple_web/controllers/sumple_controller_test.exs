defmodule ApiSumpleWeb.SumpleControllerTest do
  use ApiSumpleWeb.ConnCase

  alias ApiSumple.Api
  alias ApiSumple.Api.Sumple

  @create_attrs %{body: "some body", title: "some title"}
  @update_attrs %{body: "some updated body", title: "some updated title"}
  @invalid_attrs %{body: nil, title: nil}

  def fixture(:sumple) do
    {:ok, sumple} = Api.create_sumple(@create_attrs)
    sumple
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all sumple", %{conn: conn} do
      conn = get conn, sumple_path(conn, :index)
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create sumple" do
    test "renders sumple when data is valid", %{conn: conn} do
      conn = post conn, sumple_path(conn, :create), sumple: @create_attrs
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get conn, sumple_path(conn, :show, id)
      assert json_response(conn, 200)["data"] == %{
        "id" => id,
        "body" => "some body",
        "title" => "some title"}
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post conn, sumple_path(conn, :create), sumple: @invalid_attrs
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update sumple" do
    setup [:create_sumple]

    test "renders sumple when data is valid", %{conn: conn, sumple: %Sumple{id: id} = sumple} do
      conn = put conn, sumple_path(conn, :update, sumple), sumple: @update_attrs
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get conn, sumple_path(conn, :show, id)
      assert json_response(conn, 200)["data"] == %{
        "id" => id,
        "body" => "some updated body",
        "title" => "some updated title"}
    end

    test "renders errors when data is invalid", %{conn: conn, sumple: sumple} do
      conn = put conn, sumple_path(conn, :update, sumple), sumple: @invalid_attrs
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete sumple" do
    setup [:create_sumple]

    test "deletes chosen sumple", %{conn: conn, sumple: sumple} do
      conn = delete conn, sumple_path(conn, :delete, sumple)
      assert response(conn, 204)
      assert_error_sent 404, fn ->
        get conn, sumple_path(conn, :show, sumple)
      end
    end
  end

  defp create_sumple(_) do
    sumple = fixture(:sumple)
    {:ok, sumple: sumple}
  end
end
