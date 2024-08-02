defmodule Glamm.Master.Authority do
  @moduledoc """
  The Master context.
  """

  import Ecto.Query, warn: false
  alias Glamm.Repo

  alias Glamm.Master.Authority.Creator

  @doc """
  Returns the list of mst_creator.

  ## Examples

      iex> list_mst_creator()
      [%Creator{}, ...]

  """
  def list_mst_creator do
    Repo.all(Creator)
  end

  @doc """
  Gets a single creator.

  Raises `Ecto.NoResultsError` if the Creator does not exist.

  ## Examples

      iex> get_creator!(123)
      %Creator{}

      iex> get_creator!(456)
      ** (Ecto.NoResultsError)

  """
  def get_creator!(id), do: Repo.get!(Creator, id)

  @doc """
  Creates a creator.

  ## Examples

      iex> create_creator(%{field: value})
      {:ok, %Creator{}}

      iex> create_creator(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_creator(attrs \\ %{}) do
    %Creator{}
    |> Creator.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a creator.

  ## Examples

      iex> update_creator(creator, %{field: new_value})
      {:ok, %Creator{}}

      iex> update_creator(creator, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_creator(%Creator{} = creator, attrs) do
    creator
    |> Creator.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a creator.

  ## Examples

      iex> delete_creator(creator)
      {:ok, %Creator{}}

      iex> delete_creator(creator)
      {:error, %Ecto.Changeset{}}

  """
  def delete_creator(%Creator{} = creator) do
    Repo.delete(creator)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking creator changes.

  ## Examples

      iex> change_creator(creator)
      %Ecto.Changeset{data: %Creator{}}

  """
  def change_creator(%Creator{} = creator, attrs \\ %{}) do
    Creator.changeset(creator, attrs)
  end

  alias Glamm.Master.Authority.GMD

  @doc """
  Returns the list of mst_gmd.

  ## Examples

      iex> list_mst_gmd()
      [%GMD{}, ...]

  """
  def list_mst_gmd do
    Repo.all(GMD)
  end

  @doc """
  Gets a single gmd.

  Raises `Ecto.NoResultsError` if the Gmd does not exist.

  ## Examples

      iex> get_gmd!(123)
      %GMD{}

      iex> get_gmd!(456)
      ** (Ecto.NoResultsError)

  """
  def get_gmd!(id), do: Repo.get!(GMD, id)

  @doc """
  Creates a gmd.

  ## Examples

      iex> create_gmd(%{field: value})
      {:ok, %GMD{}}

      iex> create_gmd(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_gmd(attrs \\ %{}) do
    %GMD{}
    |> GMD.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a gmd.

  ## Examples

      iex> update_gmd(gmd, %{field: new_value})
      {:ok, %GMD{}}

      iex> update_gmd(gmd, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_gmd(%GMD{} = gmd, attrs) do
    gmd
    |> GMD.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a gmd.

  ## Examples

      iex> delete_gmd(gmd)
      {:ok, %GMD{}}

      iex> delete_gmd(gmd)
      {:error, %Ecto.Changeset{}}

  """
  def delete_gmd(%GMD{} = gmd) do
    Repo.delete(gmd)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking gmd changes.

  ## Examples

      iex> change_gmd(gmd)
      %Ecto.Changeset{data: %GMD{}}

  """
  def change_gmd(%GMD{} = gmd, attrs \\ %{}) do
    GMD.changeset(gmd, attrs)
  end

  alias Glamm.Master.Authority.Publisher

  @doc """
  Returns the list of mst_publishers.

  ## Examples

      iex> list_mst_publishers()
      [%Publisher{}, ...]

  """
  def list_mst_publishers do
    Repo.all(Publisher)
  end

  @doc """
  Gets a single publisher.

  Raises `Ecto.NoResultsError` if the Publisher does not exist.

  ## Examples

      iex> get_publisher!(123)
      %Publisher{}

      iex> get_publisher!(456)
      ** (Ecto.NoResultsError)

  """
  def get_publisher!(id), do: Repo.get!(Publisher, id)

  @doc """
  Creates a publisher.

  ## Examples

      iex> create_publisher(%{field: value})
      {:ok, %Publisher{}}

      iex> create_publisher(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_publisher(attrs \\ %{}) do
    %Publisher{}
    |> Publisher.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a publisher.

  ## Examples

      iex> update_publisher(publisher, %{field: new_value})
      {:ok, %Publisher{}}

      iex> update_publisher(publisher, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_publisher(%Publisher{} = publisher, attrs) do
    publisher
    |> Publisher.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a publisher.

  ## Examples

      iex> delete_publisher(publisher)
      {:ok, %Publisher{}}

      iex> delete_publisher(publisher)
      {:error, %Ecto.Changeset{}}

  """
  def delete_publisher(%Publisher{} = publisher) do
    Repo.delete(publisher)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking publisher changes.

  ## Examples

      iex> change_publisher(publisher)
      %Ecto.Changeset{data: %Publisher{}}

  """
  def change_publisher(%Publisher{} = publisher, attrs \\ %{}) do
    Publisher.changeset(publisher, attrs)
  end

  alias Glamm.Master.Authority.ContentTypes

  @doc """
  Returns the list of mst_content_types.

  ## Examples

      iex> list_mst_content_types()
      [%ContentTypes{}, ...]

  """
  def list_mst_content_types do
    Repo.all(ContentTypes)
  end

  @doc """
  Gets a single content_types.

  Raises `Ecto.NoResultsError` if the Content types does not exist.

  ## Examples

      iex> get_content_types!(123)
      %ContentTypes{}

      iex> get_content_types!(456)
      ** (Ecto.NoResultsError)

  """
  def get_content_types!(id), do: Repo.get!(ContentTypes, id)

  @doc """
  Creates a content_types.

  ## Examples

      iex> create_content_types(%{field: value})
      {:ok, %ContentTypes{}}

      iex> create_content_types(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_content_types(attrs \\ %{}) do
    %ContentTypes{}
    |> ContentTypes.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a content_types.

  ## Examples

      iex> update_content_types(content_types, %{field: new_value})
      {:ok, %ContentTypes{}}

      iex> update_content_types(content_types, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_content_types(%ContentTypes{} = content_types, attrs) do
    content_types
    |> ContentTypes.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a content_types.

  ## Examples

      iex> delete_content_types(content_types)
      {:ok, %ContentTypes{}}

      iex> delete_content_types(content_types)
      {:error, %Ecto.Changeset{}}

  """
  def delete_content_types(%ContentTypes{} = content_types) do
    Repo.delete(content_types)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking content_types changes.

  ## Examples

      iex> change_content_types(content_types)
      %Ecto.Changeset{data: %ContentTypes{}}

  """
  def change_content_types(%ContentTypes{} = content_types, attrs \\ %{}) do
    ContentTypes.changeset(content_types, attrs)
  end

  alias Glamm.Master.Authority.CarrierTypes

  @doc """
  Returns the list of mst_carrier_types.

  ## Examples

      iex> list_mst_carrier_types()
      [%CarrierTypes{}, ...]

  """
  def list_mst_carrier_types do
    Repo.all(CarrierTypes)
  end

  @doc """
  Gets a single carrier_types.

  Raises `Ecto.NoResultsError` if the Carrier types does not exist.

  ## Examples

      iex> get_carrier_types!(123)
      %CarrierTypes{}

      iex> get_carrier_types!(456)
      ** (Ecto.NoResultsError)

  """
  def get_carrier_types!(id), do: Repo.get!(CarrierTypes, id)

  @doc """
  Creates a carrier_types.

  ## Examples

      iex> create_carrier_types(%{field: value})
      {:ok, %CarrierTypes{}}

      iex> create_carrier_types(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_carrier_types(attrs \\ %{}) do
    %CarrierTypes{}
    |> CarrierTypes.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a carrier_types.

  ## Examples

      iex> update_carrier_types(carrier_types, %{field: new_value})
      {:ok, %CarrierTypes{}}

      iex> update_carrier_types(carrier_types, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_carrier_types(%CarrierTypes{} = carrier_types, attrs) do
    carrier_types
    |> CarrierTypes.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a carrier_types.

  ## Examples

      iex> delete_carrier_types(carrier_types)
      {:ok, %CarrierTypes{}}

      iex> delete_carrier_types(carrier_types)
      {:error, %Ecto.Changeset{}}

  """
  def delete_carrier_types(%CarrierTypes{} = carrier_types) do
    Repo.delete(carrier_types)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking carrier_types changes.

  ## Examples

      iex> change_carrier_types(carrier_types)
      %Ecto.Changeset{data: %CarrierTypes{}}

  """
  def change_carrier_types(%CarrierTypes{} = carrier_types, attrs \\ %{}) do
    CarrierTypes.changeset(carrier_types, attrs)
  end

  alias Glamm.Master.Authority.MediaTypes

  @doc """
  Returns the list of mst_media_types.

  ## Examples

      iex> list_mst_media_types()
      [%MediaTypes{}, ...]

  """
  def list_mst_media_types do
    Repo.all(MediaTypes)
  end

  @doc """
  Gets a single media_types.

  Raises `Ecto.NoResultsError` if the Media types does not exist.

  ## Examples

      iex> get_media_types!(123)
      %MediaTypes{}

      iex> get_media_types!(456)
      ** (Ecto.NoResultsError)

  """
  def get_media_types!(id), do: Repo.get!(MediaTypes, id)

  @doc """
  Creates a media_types.

  ## Examples

      iex> create_media_types(%{field: value})
      {:ok, %MediaTypes{}}

      iex> create_media_types(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_media_types(attrs \\ %{}) do
    %MediaTypes{}
    |> MediaTypes.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a media_types.

  ## Examples

      iex> update_media_types(media_types, %{field: new_value})
      {:ok, %MediaTypes{}}

      iex> update_media_types(media_types, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_media_types(%MediaTypes{} = media_types, attrs) do
    media_types
    |> MediaTypes.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a media_types.

  ## Examples

      iex> delete_media_types(media_types)
      {:ok, %MediaTypes{}}

      iex> delete_media_types(media_types)
      {:error, %Ecto.Changeset{}}

  """
  def delete_media_types(%MediaTypes{} = media_types) do
    Repo.delete(media_types)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking media_types changes.

  ## Examples

      iex> change_media_types(media_types)
      %Ecto.Changeset{data: %MediaTypes{}}

  """
  def change_media_types(%MediaTypes{} = media_types, attrs \\ %{}) do
    MediaTypes.changeset(media_types, attrs)
  end

  alias Glamm.Master.Authority.Supplier

  @doc """
  Returns the list of mst_suppliers.

  ## Examples

      iex> list_mst_suppliers()
      [%Supplier{}, ...]

  """
  def list_mst_suppliers do
    Repo.all(Supplier)
  end

  @doc """
  Gets a single supplier.

  Raises `Ecto.NoResultsError` if the Supplier does not exist.

  ## Examples

      iex> get_supplier!(123)
      %Supplier{}

      iex> get_supplier!(456)
      ** (Ecto.NoResultsError)

  """
  def get_supplier!(id), do: Repo.get!(Supplier, id)

  @doc """
  Creates a supplier.

  ## Examples

      iex> create_supplier(%{field: value})
      {:ok, %Supplier{}}

      iex> create_supplier(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_supplier(attrs \\ %{}) do
    %Supplier{}
    |> Supplier.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a supplier.

  ## Examples

      iex> update_supplier(supplier, %{field: new_value})
      {:ok, %Supplier{}}

      iex> update_supplier(supplier, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_supplier(%Supplier{} = supplier, attrs) do
    supplier
    |> Supplier.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a supplier.

  ## Examples

      iex> delete_supplier(supplier)
      {:ok, %Supplier{}}

      iex> delete_supplier(supplier)
      {:error, %Ecto.Changeset{}}

  """
  def delete_supplier(%Supplier{} = supplier) do
    Repo.delete(supplier)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking supplier changes.

  ## Examples

      iex> change_supplier(supplier)
      %Ecto.Changeset{data: %Supplier{}}

  """
  def change_supplier(%Supplier{} = supplier, attrs \\ %{}) do
    Supplier.changeset(supplier, attrs)
  end

  alias Glamm.Master.Authority.Topic

  @doc """
  Returns the list of mst_topics.

  ## Examples

      iex> list_mst_topics()
      [%Topic{}, ...]

  """
  def list_mst_topics do
    Repo.all(Topic)
  end

  @doc """
  Gets a single topic.

  Raises `Ecto.NoResultsError` if the Topic does not exist.

  ## Examples

      iex> get_topic!(123)
      %Topic{}

      iex> get_topic!(456)
      ** (Ecto.NoResultsError)

  """
  def get_topic!(id), do: Repo.get!(Topic, id)

  @doc """
  Creates a topic.

  ## Examples

      iex> create_topic(%{field: value})
      {:ok, %Topic{}}

      iex> create_topic(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_topic(attrs \\ %{}) do
    %Topic{}
    |> Topic.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a topic.

  ## Examples

      iex> update_topic(topic, %{field: new_value})
      {:ok, %Topic{}}

      iex> update_topic(topic, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_topic(%Topic{} = topic, attrs) do
    topic
    |> Topic.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a topic.

  ## Examples

      iex> delete_topic(topic)
      {:ok, %Topic{}}

      iex> delete_topic(topic)
      {:error, %Ecto.Changeset{}}

  """
  def delete_topic(%Topic{} = topic) do
    Repo.delete(topic)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking topic changes.

  ## Examples

      iex> change_topic(topic)
      %Ecto.Changeset{data: %Topic{}}

  """
  def change_topic(%Topic{} = topic, attrs \\ %{}) do
    Topic.changeset(topic, attrs)
  end

  alias Glamm.Master.Authority.Location

  @doc """
  Returns the list of mst_locations.

  ## Examples

      iex> list_mst_locations()
      [%Location{}, ...]

  """
  def list_mst_locations do
    Repo.all(Location)
  end

  @doc """
  Gets a single location.

  Raises `Ecto.NoResultsError` if the Location does not exist.

  ## Examples

      iex> get_location!(123)
      %Location{}

      iex> get_location!(456)
      ** (Ecto.NoResultsError)

  """
  def get_location!(id), do: Repo.get!(Location, id)

  @doc """
  Creates a location.

  ## Examples

      iex> create_location(%{field: value})
      {:ok, %Location{}}

      iex> create_location(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_location(attrs \\ %{}) do
    %Location{}
    |> Location.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a location.

  ## Examples

      iex> update_location(location, %{field: new_value})
      {:ok, %Location{}}

      iex> update_location(location, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_location(%Location{} = location, attrs) do
    location
    |> Location.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a location.

  ## Examples

      iex> delete_location(location)
      {:ok, %Location{}}

      iex> delete_location(location)
      {:error, %Ecto.Changeset{}}

  """
  def delete_location(%Location{} = location) do
    Repo.delete(location)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking location changes.

  ## Examples

      iex> change_location(location)
      %Ecto.Changeset{data: %Location{}}

  """
  def change_location(%Location{} = location, attrs \\ %{}) do
    Location.changeset(location, attrs)
  end

  alias Glamm.Master.Authority.RelationTerms

  @doc """
  Returns the list of mst_relation_terms.

  ## Examples

      iex> list_mst_relation_terms()
      [%RelationTerms{}, ...]

  """
  def list_mst_relation_terms do
    Repo.all(RelationTerms)
  end

  @doc """
  Gets a single relation_terms.

  Raises `Ecto.NoResultsError` if the Relation terms does not exist.

  ## Examples

      iex> get_relation_terms!(123)
      %RelationTerms{}

      iex> get_relation_terms!(456)
      ** (Ecto.NoResultsError)

  """
  def get_relation_terms!(id), do: Repo.get!(RelationTerms, id)

  @doc """
  Creates a relation_terms.

  ## Examples

      iex> create_relation_terms(%{field: value})
      {:ok, %RelationTerms{}}

      iex> create_relation_terms(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_relation_terms(attrs \\ %{}) do
    %RelationTerms{}
    |> RelationTerms.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a relation_terms.

  ## Examples

      iex> update_relation_terms(relation_terms, %{field: new_value})
      {:ok, %RelationTerms{}}

      iex> update_relation_terms(relation_terms, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_relation_terms(%RelationTerms{} = relation_terms, attrs) do
    relation_terms
    |> RelationTerms.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a relation_terms.

  ## Examples

      iex> delete_relation_terms(relation_terms)
      {:ok, %RelationTerms{}}

      iex> delete_relation_terms(relation_terms)
      {:error, %Ecto.Changeset{}}

  """
  def delete_relation_terms(%RelationTerms{} = relation_terms) do
    Repo.delete(relation_terms)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking relation_terms changes.

  ## Examples

      iex> change_relation_terms(relation_terms)
      %Ecto.Changeset{data: %RelationTerms{}}

  """
  def change_relation_terms(%RelationTerms{} = relation_terms, attrs \\ %{}) do
    RelationTerms.changeset(relation_terms, attrs)
  end
end
