defmodule Glamm.Master.Lookup do
  @moduledoc """
  The Master.Lookup context.
  """

  import Ecto.Query, warn: false
  alias Glamm.Repo

  alias Glamm.Master.Lookup.Place

  @doc """
  Returns the list of mst_places.

  ## Examples

      iex> list_mst_places()
      [%Place{}, ...]

  """
  def list_mst_places do
    Repo.all(Place)
  end

  @doc """
  Gets a single place.

  Raises `Ecto.NoResultsError` if the Place does not exist.

  ## Examples

      iex> get_place!(123)
      %Place{}

      iex> get_place!(456)
      ** (Ecto.NoResultsError)

  """
  def get_place!(id), do: Repo.get!(Place, id)

  @doc """
  Creates a place.

  ## Examples

      iex> create_place(%{field: value})
      {:ok, %Place{}}

      iex> create_place(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_place(attrs \\ %{}) do
    %Place{}
    |> Place.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a place.

  ## Examples

      iex> update_place(place, %{field: new_value})
      {:ok, %Place{}}

      iex> update_place(place, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_place(%Place{} = place, attrs) do
    place
    |> Place.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a place.

  ## Examples

      iex> delete_place(place)
      {:ok, %Place{}}

      iex> delete_place(place)
      {:error, %Ecto.Changeset{}}

  """
  def delete_place(%Place{} = place) do
    Repo.delete(place)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking place changes.

  ## Examples

      iex> change_place(place)
      %Ecto.Changeset{data: %Place{}}

  """
  def change_place(%Place{} = place, attrs \\ %{}) do
    Place.changeset(place, attrs)
  end

  alias Glamm.Master.Lookup.ItemStatus

  @doc """
  Returns the list of mst_item_status.

  ## Examples

      iex> list_mst_item_status()
      [%ItemStatus{}, ...]

  """
  def list_mst_item_status do
    Repo.all(ItemStatus)
  end

  @doc """
  Gets a single item_status.

  Raises `Ecto.NoResultsError` if the Item status does not exist.

  ## Examples

      iex> get_item_status!(123)
      %ItemStatus{}

      iex> get_item_status!(456)
      ** (Ecto.NoResultsError)

  """
  def get_item_status!(id), do: Repo.get!(ItemStatus, id)

  @doc """
  Creates a item_status.

  ## Examples

      iex> create_item_status(%{field: value})
      {:ok, %ItemStatus{}}

      iex> create_item_status(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_item_status(attrs \\ %{}) do
    %ItemStatus{}
    |> ItemStatus.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a item_status.

  ## Examples

      iex> update_item_status(item_status, %{field: new_value})
      {:ok, %ItemStatus{}}

      iex> update_item_status(item_status, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_item_status(%ItemStatus{} = item_status, attrs) do
    item_status
    |> ItemStatus.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a item_status.

  ## Examples

      iex> delete_item_status(item_status)
      {:ok, %ItemStatus{}}

      iex> delete_item_status(item_status)
      {:error, %Ecto.Changeset{}}

  """
  def delete_item_status(%ItemStatus{} = item_status) do
    Repo.delete(item_status)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking item_status changes.

  ## Examples

      iex> change_item_status(item_status)
      %Ecto.Changeset{data: %ItemStatus{}}

  """
  def change_item_status(%ItemStatus{} = item_status, attrs \\ %{}) do
    ItemStatus.changeset(item_status, attrs)
  end

  alias Glamm.Master.Lookup.Language

  @doc """
  Returns the list of mst_language.

  ## Examples

      iex> list_mst_language()
      [%Language{}, ...]

  """
  def list_mst_language do
    Repo.all(Language)
  end

  @doc """
  Gets a single language.

  Raises `Ecto.NoResultsError` if the Language does not exist.

  ## Examples

      iex> get_language!(123)
      %Language{}

      iex> get_language!(456)
      ** (Ecto.NoResultsError)

  """
  def get_language!(id), do: Repo.get!(Language, id)

  @doc """
  Creates a language.

  ## Examples

      iex> create_language(%{field: value})
      {:ok, %Language{}}

      iex> create_language(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_language(attrs \\ %{}) do
    %Language{}
    |> Language.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a language.

  ## Examples

      iex> update_language(language, %{field: new_value})
      {:ok, %Language{}}

      iex> update_language(language, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_language(%Language{} = language, attrs) do
    language
    |> Language.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a language.

  ## Examples

      iex> delete_language(language)
      {:ok, %Language{}}

      iex> delete_language(language)
      {:error, %Ecto.Changeset{}}

  """
  def delete_language(%Language{} = language) do
    Repo.delete(language)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking language changes.

  ## Examples

      iex> change_language(language)
      %Ecto.Changeset{data: %Language{}}

  """
  def change_language(%Language{} = language, attrs \\ %{}) do
    Language.changeset(language, attrs)
  end

  alias Glamm.Master.Lookup.Label

  @doc """
  Returns the list of mst_labels.

  ## Examples

      iex> list_mst_labels()
      [%Label{}, ...]

  """
  def list_mst_labels do
    Repo.all(Label)
  end

  @doc """
  Gets a single label.

  Raises `Ecto.NoResultsError` if the Label does not exist.

  ## Examples

      iex> get_label!(123)
      %Label{}

      iex> get_label!(456)
      ** (Ecto.NoResultsError)

  """
  def get_label!(id), do: Repo.get!(Label, id)

  @doc """
  Creates a label.

  ## Examples

      iex> create_label(%{field: value})
      {:ok, %Label{}}

      iex> create_label(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_label(attrs \\ %{}) do
    %Label{}
    |> Label.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a label.

  ## Examples

      iex> update_label(label, %{field: new_value})
      {:ok, %Label{}}

      iex> update_label(label, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_label(%Label{} = label, attrs) do
    label
    |> Label.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a label.

  ## Examples

      iex> delete_label(label)
      {:ok, %Label{}}

      iex> delete_label(label)
      {:error, %Ecto.Changeset{}}

  """
  def delete_label(%Label{} = label) do
    Repo.delete(label)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking label changes.

  ## Examples

      iex> change_label(label)
      %Ecto.Changeset{data: %Label{}}

  """
  def change_label(%Label{} = label, attrs \\ %{}) do
    Label.changeset(label, attrs)
  end

  alias Glamm.Master.Lookup.Frequency

  @doc """
  Returns the list of mst_frequency.

  ## Examples

      iex> list_mst_frequency()
      [%Frequency{}, ...]

  """
  def list_mst_frequency do
    Repo.all(Frequency)
  end

  @doc """
  Gets a single frequency.

  Raises `Ecto.NoResultsError` if the Frequency does not exist.

  ## Examples

      iex> get_frequency!(123)
      %Frequency{}

      iex> get_frequency!(456)
      ** (Ecto.NoResultsError)

  """
  def get_frequency!(id), do: Repo.get!(Frequency, id)

  @doc """
  Creates a frequency.

  ## Examples

      iex> create_frequency(%{field: value})
      {:ok, %Frequency{}}

      iex> create_frequency(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_frequency(attrs \\ %{}) do
    %Frequency{}
    |> Frequency.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a frequency.

  ## Examples

      iex> update_frequency(frequency, %{field: new_value})
      {:ok, %Frequency{}}

      iex> update_frequency(frequency, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_frequency(%Frequency{} = frequency, attrs) do
    frequency
    |> Frequency.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a frequency.

  ## Examples

      iex> delete_frequency(frequency)
      {:ok, %Frequency{}}

      iex> delete_frequency(frequency)
      {:error, %Ecto.Changeset{}}

  """
  def delete_frequency(%Frequency{} = frequency) do
    Repo.delete(frequency)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking frequency changes.

  ## Examples

      iex> change_frequency(frequency)
      %Ecto.Changeset{data: %Frequency{}}

  """
  def change_frequency(%Frequency{} = frequency, attrs \\ %{}) do
    Frequency.changeset(frequency, attrs)
  end
end
