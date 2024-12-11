defmodule Glamm.Gallery do
  @moduledoc """
  The Gallery context.
  """

  import Ecto.Query, warn: false
  alias Glamm.Repo
  alias Glamm.Gallery.Collection
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

  def length_gal_collection_type do
    Repo.aggregate(CollectionType, :count, :id)
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

  def length_gal_assets do
    Repo.aggregate(Assets, :count, :id)
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
    source = Path.join([:code.priv_dir(:glamm), "static", "uploads", Path.basename(assets.path)])
    File.rm(source)

    Repo.transaction(fn ->
      from(c in Collection, where: c.thumbnail_id == ^assets.id)
      |> Repo.update_all(set: [thumbnail_id: nil])

      Repo.delete(assets)
    end)
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

  def length_gal_files do
    Repo.aggregate(Files, :count, :id)
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

  alias Glamm.Gallery.Requisition
  # alias Glamm.Accounts.User

  @doc """
  Returns the list of gal_requisitions.

  ## Examples

      iex> list_gal_requisitions()
      [%Requisition{}, ...]

  """
  def list_gal_requisitions do
    # Requisition |> Repo.all() |> Repo.preload(:users)
    Repo.all(Requisition)
  end

  @doc """
  Gets a single requisition.

  Raises `Ecto.NoResultsError` if the Requisition does not exist.

  ## Examples

      iex> get_requisition!(123)
      %Requisition{}

      iex> get_requisition!(456)
      ** (Ecto.NoResultsError)

  """
  def get_requisition!(id), do: Repo.get!(Requisition, id)

  @doc """
  Creates a requisition.

  ## Examples

      iex> create_requisition(%{field: value})
      {:ok, %Requisition{}}

      iex> create_requisition(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_requisition(attrs \\ %{}) do
    %Requisition{}
    |> Requisition.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a requisition.

  ## Examples

      iex> update_requisition(requisition, %{field: new_value})
      {:ok, %Requisition{}}

      iex> update_requisition(requisition, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_requisition(%Requisition{} = requisition, attrs) do
    requisition
    |> Requisition.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a requisition.

  ## Examples

      iex> delete_requisition(requisition)
      {:ok, %Requisition{}}

      iex> delete_requisition(requisition)
      {:error, %Ecto.Changeset{}}

  """
  def delete_requisition(%Requisition{} = requisition) do
    Repo.delete(requisition)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking requisition changes.

  ## Examples

      iex> change_requisition(requisition)
      %Ecto.Changeset{data: %Requisition{}}

  """
  def change_requisition(%Requisition{} = requisition, attrs \\ %{}) do
    Requisition.changeset(requisition, attrs)
  end

  def length_gal_requisition do
    Repo.aggregate(Requisition, :count, :id)
  end

  alias Glamm.Gallery.Collection

  @doc """
  Returns the list of gal_collections.

  ## Examples

      iex> list_gal_collections()
      [%Collection{}, ...]

  """
  def list_gal_collections do
    Repo.all(Collection)
  end

  def length_gal_collections do
    Repo.aggregate(Collection, :count, :id)
  end

  @doc """
  Gets a single collection.

  Raises `Ecto.NoResultsError` if the Collection does not exist.

  ## Examples

      iex> get_collection!(123)
      %Collection{}

      iex> get_collection!(456)
      ** (Ecto.NoResultsError)

  """
  def get_collection!(id) do
    Collection
    |> Repo.get!(id)
    |> Repo.preload(:owner)
    |> Repo.preload(:resource_class)
    |> Repo.preload(:resource_template)
    |> Repo.preload(:thumbnail)
    |> Repo.preload(:collection_type)
    |> Repo.preload(:node)
  end

  @doc """
  Creates a collection.

  ## Examples

      iex> create_collection(%{field: value})
      {:ok, %Collection{}}

      iex> create_collection(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_collection(attrs \\ %{}) do
    %Collection{}
    |> Collection.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a collection.

  ## Examples

      iex> update_collection(collection, %{field: new_value})
      {:ok, %Collection{}}

      iex> update_collection(collection, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_collection(%Collection{} = collection, attrs) do
    collection
    |> Collection.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a collection.

  ## Examples

      iex> delete_collection(collection)
      {:ok, %Collection{}}

      iex> delete_collection(collection)
      {:error, %Ecto.Changeset{}}

  """
  def delete_collection(%Collection{} = collection) do
    Repo.delete(collection)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking collection changes.

  ## Examples

      iex> change_collection(collection)
      %Ecto.Changeset{data: %Collection{}}

  """
  def change_collection(%Collection{} = collection, attrs \\ %{}) do
    Collection.changeset(collection, attrs)
  end

  alias Glamm.Gallery.Item

  @doc """
  Returns the list of gal_items.

  ## Examples

      iex> list_gal_items()
      [%Item{}, ...]

  """
  def list_gal_items do
    Repo.all(Item)
  end

  def length_gal_items do
    Repo.aggregate(Item, :count, :id)
  end

  @doc """
  Gets a single item.

  Raises `Ecto.NoResultsError` if the Item does not exist.

  ## Examples

      iex> get_item!(123)
      %Item{}

      iex> get_item!(456)
      ** (Ecto.NoResultsError)

  """
  def get_item!(id), do: Repo.get!(Item, id)

  @doc """
  Creates a item.

  ## Examples

      iex> create_item(%{field: value})
      {:ok, %Item{}}

      iex> create_item(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_item(attrs \\ %{}) do
    %Item{}
    |> Item.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a item.

  ## Examples

      iex> update_item(item, %{field: new_value})
      {:ok, %Item{}}

      iex> update_item(item, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_item(%Item{} = item, attrs) do
    item
    |> Item.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a item.

  ## Examples

      iex> delete_item(item)
      {:ok, %Item{}}

      iex> delete_item(item)
      {:error, %Ecto.Changeset{}}

  """
  def delete_item(%Item{} = item) do
    Repo.delete(item)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking item changes.

  ## Examples

      iex> change_item(item)
      %Ecto.Changeset{data: %Item{}}

  """
  def change_item(%Item{} = item, attrs \\ %{}) do
    Item.changeset(item, attrs)
  end

  alias Glamm.Gallery.ItemValue

  @doc """
  Returns the list of gal_item_value.

  ## Examples

      iex> list_gal_item_value()
      [%ItemValue{}, ...]

  """
  def list_gal_item_value do
    Repo.all(ItemValue)
  end

  def length_gal_item_value do
    Repo.aggregate(ItemValue, :count, :id)
  end

  @doc """
  Gets a single item_value.

  Raises `Ecto.NoResultsError` if the Item value does not exist.

  ## Examples

      iex> get_item_value!(123)
      %ItemValue{}

      iex> get_item_value!(456)
      ** (Ecto.NoResultsError)

  """
  def get_item_value!(id), do: Repo.get!(ItemValue, id)

  @doc """
  Creates a item_value.

  ## Examples

      iex> create_item_value(%{field: value})
      {:ok, %ItemValue{}}

      iex> create_item_value(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_item_value(attrs \\ %{}) do
    %ItemValue{}
    |> ItemValue.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a item_value.

  ## Examples

      iex> update_item_value(item_value, %{field: new_value})
      {:ok, %ItemValue{}}

      iex> update_item_value(item_value, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_item_value(%ItemValue{} = item_value, attrs) do
    item_value
    |> ItemValue.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a item_value.

  ## Examples

      iex> delete_item_value(item_value)
      {:ok, %ItemValue{}}

      iex> delete_item_value(item_value)
      {:error, %Ecto.Changeset{}}

  """
  def delete_item_value(%ItemValue{} = item_value) do
    Repo.delete(item_value)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking item_value changes.

  ## Examples

      iex> change_item_value(item_value)
      %Ecto.Changeset{data: %ItemValue{}}

  """
  def change_item_value(%ItemValue{} = item_value, attrs \\ %{}) do
    ItemValue.changeset(item_value, attrs)
  end
end
