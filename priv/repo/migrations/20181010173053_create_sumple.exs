defmodule ApiSumple.Repo.Migrations.CreateSumple do
  use Ecto.Migration

  def change do
    create table(:sumple) do
      add :title, :string
      add :body, :text

      timestamps()
    end

  end
end
