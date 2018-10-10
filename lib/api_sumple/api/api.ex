defmodule ApiSumple.Api do
  @moduledoc """
  The Api context.
  """

  import Ecto.Query, warn: false
  alias ApiSumple.Repo

  alias ApiSumple.Api.Sumple

  @doc """
  Returns the list of sumple.

  ## Examples

      iex> list_sumple()
      [%Sumple{}, ...]

  """
  def list_sumple do
    Repo.all(Sumple)
  end

  @doc """
  Gets a single sumple.

  Raises `Ecto.NoResultsError` if the Sumple does not exist.

  ## Examples

      iex> get_sumple!(123)
      %Sumple{}

      iex> get_sumple!(456)
      ** (Ecto.NoResultsError)

  """
  def get_sumple!(id), do: Repo.get!(Sumple, id)

  @doc """
  Creates a sumple.

  ## Examples

      iex> create_sumple(%{field: value})
      {:ok, %Sumple{}}

      iex> create_sumple(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_sumple(attrs \\ %{}) do
    %Sumple{}
    |> Sumple.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a sumple.

  ## Examples

      iex> update_sumple(sumple, %{field: new_value})
      {:ok, %Sumple{}}

      iex> update_sumple(sumple, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_sumple(%Sumple{} = sumple, attrs) do
    sumple
    |> Sumple.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Sumple.

  ## Examples

      iex> delete_sumple(sumple)
      {:ok, %Sumple{}}

      iex> delete_sumple(sumple)
      {:error, %Ecto.Changeset{}}

  """
  def delete_sumple(%Sumple{} = sumple) do
    Repo.delete(sumple)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking sumple changes.

  ## Examples

      iex> change_sumple(sumple)
      %Ecto.Changeset{source: %Sumple{}}

  """
  def change_sumple(%Sumple{} = sumple) do
    Sumple.changeset(sumple, %{})
  end
end
