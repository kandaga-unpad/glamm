defmodule Glamm.Metadata do
  @moduledoc """
  The Metadata context.
  """

  import Ecto
  import Ecto.Query, warn: false

  alias Glamm.Repo

  alias Glamm.Metadata.Vocabulary

  @doc """
  Returns the list of metadata_vocabularies.

  ## Examples

      iex> list_metadata_vocabularies()
      [%Vocabulary{}, ...]

  """
  def list_metadata_vocabularies do
    Repo.all(Vocabulary)
  end

  @doc """
  Gets a single vocabulary.

  Raises `Ecto.NoResultsError` if the Vocabulary does not exist.

  ## Examples

      iex> get_vocabulary!(123)
      %Vocabulary{}

      iex> get_vocabulary!(456)
      ** (Ecto.NoResultsError)

  """
  def get_vocabulary!(id), do: Repo.get!(Vocabulary, id)

  @doc """
  Creates a vocabulary.

  ## Examples

      iex> create_vocabulary(%{field: value})
      {:ok, %Vocabulary{}}

      iex> create_vocabulary(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_vocabulary(attrs \\ %{}) do
    %Vocabulary{}
    |> Vocabulary.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a vocabulary.

  ## Examples

      iex> update_vocabulary(vocabulary, %{field: new_value})
      {:ok, %Vocabulary{}}

      iex> update_vocabulary(vocabulary, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_vocabulary(%Vocabulary{} = vocabulary, attrs) do
    vocabulary
    |> Vocabulary.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a vocabulary.

  ## Examples

      iex> delete_vocabulary(vocabulary)
      {:ok, %Vocabulary{}}

      iex> delete_vocabulary(vocabulary)
      {:error, %Ecto.Changeset{}}

  """
  def delete_vocabulary(%Vocabulary{} = vocabulary) do
    Repo.delete(vocabulary)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking vocabulary changes.

  ## Examples

      iex> change_vocabulary(vocabulary)
      %Ecto.Changeset{data: %Vocabulary{}}

  """
  def change_vocabulary(%Vocabulary{} = vocabulary, attrs \\ %{}) do
    Vocabulary.changeset(vocabulary, attrs)
  end

  alias Glamm.Metadata.Property

  @doc """
  Returns the list of metadata_properties.

  ## Examples

      iex> list_metadata_properties()
      [%Property{}, ...]

  """
  def list_metadata_properties do
    Repo.all(Property)
  end

  @doc """
  Gets a single property.

  Raises `Ecto.NoResultsError` if the Property does not exist.

  ## Examples

      iex> get_property!(123)
      %Property{}

      iex> get_property!(456)
      ** (Ecto.NoResultsError)

  """
  def get_property!(id), do: Repo.get!(Property, id)

  @doc """
  Creates a property.

  ## Examples

      iex> create_property(%{field: value})
      {:ok, %Property{}}

      iex> create_property(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_property(attrs \\ %{}) do
    %Property{}
    |> Property.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a property.

  ## Examples

      iex> update_property(property, %{field: new_value})
      {:ok, %Property{}}

      iex> update_property(property, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_property(%Property{} = property, attrs) do
    property
    |> Property.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a property.

  ## Examples

      iex> delete_property(property)
      {:ok, %Property{}}

      iex> delete_property(property)
      {:error, %Ecto.Changeset{}}

  """
  def delete_property(%Property{} = property) do
    Repo.delete(property)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking property changes.

  ## Examples

      iex> change_property(property)
      %Ecto.Changeset{data: %Property{}}

  """
  def change_property(%Property{} = property, attrs \\ %{}) do
    Property.changeset(property, attrs)
  end

  alias Glamm.Metadata.ResourceClass

  @doc """
  Returns the list of resource_class.

  ## Examples

      iex> list_resource_class()
      [%ResourceClass{}, ...]

  """
  def list_resource_class do
    Repo.all(ResourceClass)
  end

  @doc """
  Gets a single resource_class.

  Raises `Ecto.NoResultsError` if the Resource class does not exist.

  ## Examples

      iex> get_resource_class!(123)
      %ResourceClass{}

      iex> get_resource_class!(456)
      ** (Ecto.NoResultsError)

  """
  def get_resource_class!(id), do: Repo.get!(ResourceClass, id)

  @doc """
  Creates a resource_class.

  ## Examples

      iex> create_resource_class(%{field: value})
      {:ok, %ResourceClass{}}

      iex> create_resource_class(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_resource_class(attrs \\ %{}) do
    %ResourceClass{}
    |> assoc(:vocabulary)
    |> build_assoc(attrs[:vocabulary_id])
    |> ResourceClass.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a resource_class.

  ## Examples

      iex> update_resource_class(resource_class, %{field: new_value})
      {:ok, %ResourceClass{}}

      iex> update_resource_class(resource_class, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_resource_class(%ResourceClass{} = resource_class, attrs) do
    resource_class
    |> ResourceClass.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a resource_class.

  ## Examples

      iex> delete_resource_class(resource_class)
      {:ok, %ResourceClass{}}

      iex> delete_resource_class(resource_class)
      {:error, %Ecto.Changeset{}}

  """
  def delete_resource_class(%ResourceClass{} = resource_class) do
    Repo.delete(resource_class)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking resource_class changes.

  ## Examples

      iex> change_resource_class(resource_class)
      %Ecto.Changeset{data: %ResourceClass{}}

  """
  def change_resource_class(%ResourceClass{} = resource_class, attrs \\ %{}) do
    ResourceClass.changeset(resource_class, attrs)
  end

  alias Glamm.Metadata.ResourceTemplate

  @doc """
  Returns the list of resource_template.

  ## Examples

      iex> list_resource_template()
      [%ResourceTemplate{}, ...]

  """
  def list_resource_template do
    Repo.all(ResourceTemplate)
  end

  @doc """
  Gets a single resource_template.

  Raises `Ecto.NoResultsError` if the Resource template does not exist.

  ## Examples

      iex> get_resource_template!(123)
      %ResourceTemplate{}

      iex> get_resource_template!(456)
      ** (Ecto.NoResultsError)

  """
  def get_resource_template!(id), do: Repo.get!(ResourceTemplate, id)

  @doc """
  Creates a resource_template.

  ## Examples

      iex> create_resource_template(%{field: value})
      {:ok, %ResourceTemplate{}}

      iex> create_resource_template(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_resource_template(attrs \\ %{}) do
    %ResourceTemplate{}
    |> ResourceTemplate.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a resource_template.

  ## Examples

      iex> update_resource_template(resource_template, %{field: new_value})
      {:ok, %ResourceTemplate{}}

      iex> update_resource_template(resource_template, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_resource_template(%ResourceTemplate{} = resource_template, attrs) do
    resource_template
    |> ResourceTemplate.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a resource_template.

  ## Examples

      iex> delete_resource_template(resource_template)
      {:ok, %ResourceTemplate{}}

      iex> delete_resource_template(resource_template)
      {:error, %Ecto.Changeset{}}

  """
  def delete_resource_template(%ResourceTemplate{} = resource_template) do
    Repo.delete(resource_template)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking resource_template changes.

  ## Examples

      iex> change_resource_template(resource_template)
      %Ecto.Changeset{data: %ResourceTemplate{}}

  """
  def change_resource_template(%ResourceTemplate{} = resource_template, attrs \\ %{}) do
    ResourceTemplate.changeset(resource_template, attrs)
  end

  alias Glamm.Metadata.ResourceTemplateProperty

  @doc """
  Returns the list of resource_template_property.

  ## Examples

      iex> list_resource_template_property()
      [%ResourceTemplateProperty{}, ...]

  """
  def list_resource_template_property do
    Repo.all(ResourceTemplateProperty)
  end

  @doc """
  Gets a single resource_template_property.

  Raises `Ecto.NoResultsError` if the Resource template property does not exist.

  ## Examples

      iex> get_resource_template_property!(123)
      %ResourceTemplateProperty{}

      iex> get_resource_template_property!(456)
      ** (Ecto.NoResultsError)

  """
  def get_resource_template_property!(id), do: Repo.get!(ResourceTemplateProperty, id)

  @doc """
  Creates a resource_template_property.

  ## Examples

      iex> create_resource_template_property(%{field: value})
      {:ok, %ResourceTemplateProperty{}}

      iex> create_resource_template_property(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_resource_template_property(attrs \\ %{}) do
    %ResourceTemplateProperty{}
    |> ResourceTemplateProperty.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a resource_template_property.

  ## Examples

      iex> update_resource_template_property(resource_template_property, %{field: new_value})
      {:ok, %ResourceTemplateProperty{}}

      iex> update_resource_template_property(resource_template_property, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_resource_template_property(
        %ResourceTemplateProperty{} = resource_template_property,
        attrs
      ) do
    resource_template_property
    |> ResourceTemplateProperty.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a resource_template_property.

  ## Examples

      iex> delete_resource_template_property(resource_template_property)
      {:ok, %ResourceTemplateProperty{}}

      iex> delete_resource_template_property(resource_template_property)
      {:error, %Ecto.Changeset{}}

  """
  def delete_resource_template_property(%ResourceTemplateProperty{} = resource_template_property) do
    Repo.delete(resource_template_property)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking resource_template_property changes.

  ## Examples

      iex> change_resource_template_property(resource_template_property)
      %Ecto.Changeset{data: %ResourceTemplateProperty{}}

  """
  def change_resource_template_property(
        %ResourceTemplateProperty{} = resource_template_property,
        attrs \\ %{}
      ) do
    ResourceTemplateProperty.changeset(resource_template_property, attrs)
  end
end
