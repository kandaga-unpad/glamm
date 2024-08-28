defmodule Glamm.Gallery do
  @moduledoc """
  The Gallery context.
  """

  import Ecto.Query, warn: false
  alias Glamm.Repo

  alias Glamm.Gallery.CollectionType

  @doc """
  Returns the list of gal_collection_type.

  ## Examples

      iex> list_gal_collection_type()
      [%CollectionType{}, ...]

  """
  def list_gal_collection_type do
    Repo.all(CollectionType)
  end

  @doc """
  Gets a single collection_type.

  Raises `Ecto.NoResultsError` if the Collection type does not exist.

  ## Examples

      iex> get_collection_type!(123)
      %CollectionType{}

      iex> get_collection_type!(456)
      ** (Ecto.NoResultsError)

  """
  def get_collection_type!(id), do: Repo.get!(CollectionType, id)

  @doc """
  Creates a collection_type.

  ## Examples

      iex> create_collection_type(%{field: value})
      {:ok, %CollectionType{}}

      iex> create_collection_type(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_collection_type(attrs \\ %{}) do
    %CollectionType{}
    |> CollectionType.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a collection_type.

  ## Examples

      iex> update_collection_type(collection_type, %{field: new_value})
      {:ok, %CollectionType{}}

      iex> update_collection_type(collection_type, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_collection_type(%CollectionType{} = collection_type, attrs) do
    collection_type
    |> CollectionType.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a collection_type.

  ## Examples

      iex> delete_collection_type(collection_type)
      {:ok, %CollectionType{}}

      iex> delete_collection_type(collection_type)
      {:error, %Ecto.Changeset{}}

  """
  def delete_collection_type(%CollectionType{} = collection_type) do
    Repo.delete(collection_type)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking collection_type changes.

  ## Examples

      iex> change_collection_type(collection_type)
      %Ecto.Changeset{data: %CollectionType{}}

  """
  def change_collection_type(%CollectionType{} = collection_type, attrs \\ %{}) do
    CollectionType.changeset(collection_type, attrs)
  end

  alias Glamm.Gallery.Assets

  @doc """
  Returns the list of gal_assets.

  ## Examples

      iex> list_gal_assets()
      [%Assets{}, ...]

  """
  def list_gal_assets do
    Repo.all(Assets)
  end

  @doc """
  Gets a single assets.

  Raises `Ecto.NoResultsError` if the Assets does not exist.

  ## Examples

      iex> get_assets!(123)
      %Assets{}

      iex> get_assets!(456)
      ** (Ecto.NoResultsError)

  """
  def get_assets!(id), do: Repo.get!(Assets, id)

  @doc """
  Creates a assets.

  ## Examples

      iex> create_assets(%{field: value})
      {:ok, %Assets{}}

      iex> create_assets(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_assets(attrs \\ %{}) do
    %Assets{}
    |> Assets.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a assets.

  ## Examples

      iex> update_assets(assets, %{field: new_value})
      {:ok, %Assets{}}

      iex> update_assets(assets, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_assets(%Assets{} = assets, attrs) do
    assets
    |> Assets.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a assets.

  ## Examples

      iex> delete_assets(assets)
      {:ok, %Assets{}}

      iex> delete_assets(assets)
      {:error, %Ecto.Changeset{}}

  """
  def delete_assets(%Assets{} = assets) do
    Repo.delete(assets)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking assets changes.

  ## Examples

      iex> change_assets(assets)
      %Ecto.Changeset{data: %Assets{}}

  """
  def change_assets(%Assets{} = assets, attrs \\ %{}) do
    Assets.changeset(assets, attrs)
  end

  alias Glamm.Gallery.Files

  @doc """
  Returns the list of gal_files.

  ## Examples

      iex> list_gal_files()
      [%Files{}, ...]

  """
  def list_gal_files do
    Repo.all(Files)
  end

  @doc """
  Gets a single files.

  Raises `Ecto.NoResultsError` if the Files does not exist.

  ## Examples

      iex> get_files!(123)
      %Files{}

      iex> get_files!(456)
      ** (Ecto.NoResultsError)

  """
  def get_files!(id), do: Repo.get!(Files, id)

  @doc """
  Creates a files.

  ## Examples

      iex> create_files(%{field: value})
      {:ok, %Files{}}

      iex> create_files(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_files(attrs \\ %{}) do
    %Files{}
    |> Files.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a files.

  ## Examples

      iex> update_files(files, %{field: new_value})
      {:ok, %Files{}}

      iex> update_files(files, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_files(%Files{} = files, attrs) do
    files
    |> Files.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a files.

  ## Examples

      iex> delete_files(files)
      {:ok, %Files{}}

      iex> delete_files(files)
      {:error, %Ecto.Changeset{}}

  """
  def delete_files(%Files{} = files) do
    Repo.delete(files)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking files changes.

  ## Examples

      iex> change_files(files)
      %Ecto.Changeset{data: %Files{}}

  """
  def change_files(%Files{} = files, attrs \\ %{}) do
    Files.changeset(files, attrs)
  end
end
