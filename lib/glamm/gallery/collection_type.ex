defmodule Glamm.Gallery.CollectionType do
  use Ecto.Schema
  import Ecto.Changeset

  schema "gal_collection_type" do
    field :description, :string
    field :collection_name, :string

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(collection_type, attrs) do
    collection_type
    |> cast(attrs, [:collection_name, :description])
    |> validate_required([:collection_name, :description])
  end
end
