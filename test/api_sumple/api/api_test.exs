defmodule ApiSumple.ApiTest do
  use ApiSumple.DataCase

  alias ApiSumple.Api

  describe "sumple" do
    alias ApiSumple.Api.Sumple

    @valid_attrs %{body: "some body", title: "some title"}
    @update_attrs %{body: "some updated body", title: "some updated title"}
    @invalid_attrs %{body: nil, title: nil}

    def sumple_fixture(attrs \\ %{}) do
      {:ok, sumple} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Api.create_sumple()

      sumple
    end

    test "list_sumple/0 returns all sumple" do
      sumple = sumple_fixture()
      assert Api.list_sumple() == [sumple]
    end

    test "get_sumple!/1 returns the sumple with given id" do
      sumple = sumple_fixture()
      assert Api.get_sumple!(sumple.id) == sumple
    end

    test "create_sumple/1 with valid data creates a sumple" do
      assert {:ok, %Sumple{} = sumple} = Api.create_sumple(@valid_attrs)
      assert sumple.body == "some body"
      assert sumple.title == "some title"
    end

    test "create_sumple/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Api.create_sumple(@invalid_attrs)
    end

    test "update_sumple/2 with valid data updates the sumple" do
      sumple = sumple_fixture()
      assert {:ok, sumple} = Api.update_sumple(sumple, @update_attrs)
      assert %Sumple{} = sumple
      assert sumple.body == "some updated body"
      assert sumple.title == "some updated title"
    end

    test "update_sumple/2 with invalid data returns error changeset" do
      sumple = sumple_fixture()
      assert {:error, %Ecto.Changeset{}} = Api.update_sumple(sumple, @invalid_attrs)
      assert sumple == Api.get_sumple!(sumple.id)
    end

    test "delete_sumple/1 deletes the sumple" do
      sumple = sumple_fixture()
      assert {:ok, %Sumple{}} = Api.delete_sumple(sumple)
      assert_raise Ecto.NoResultsError, fn -> Api.get_sumple!(sumple.id) end
    end

    test "change_sumple/1 returns a sumple changeset" do
      sumple = sumple_fixture()
      assert %Ecto.Changeset{} = Api.change_sumple(sumple)
    end
  end
end
