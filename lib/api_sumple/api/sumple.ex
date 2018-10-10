defmodule ApiSumple.Api.Sumple do
  use Ecto.Schema
  import Ecto.Changeset


  schema "sumple" do
    field :body, :string
    field :title, :string

    timestamps()
  end

  @doc false
  def changeset(sumple, attrs) do
    sumple
    |> cast(attrs, [:title, :body])
    |> validate_required([:title, :body])
  end
end
