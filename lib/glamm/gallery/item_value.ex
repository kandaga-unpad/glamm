defmodule Glamm.Gallery.ItemValue do
  use Ecto.Schema
  import Ecto.Changeset

  alias Glamm.Gallery.Collection
  alias Glamm.Gallery.Item
  alias Glamm.Metadata.Property

  @primary_key {:id, :binary_id, autogenerate: true}
  @derive {Phoenix.Param, key: :id}
  schema "gal_item_value" do
    field :type, :string
    field :value, :string
    field :url, :string
    field :lang, :string
    field :scope_view, :string
    # field :collection_id, :id
    belongs_to :collection, Collection, type: :binary_id
    # field :item_id, :id
    belongs_to :item, Item
    # field :property_id, :id
    belongs_to :property, Property

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(item_value, attrs) do
    item_value
    |> cast(attrs, [
      :type,
      :lang,
      :value,
      :url,
      :scope_view,
      :collection_id,
      :item_id,
      :property_id
    ])
    |> validate_required([
      :type,
      :lang,
      :value,
      :url,
      :scope_view,
      :collection_id,
      :item_id,
      :property_id
    ])
  end
end
