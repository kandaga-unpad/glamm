defmodule Glamm.Gallery.Item do
  use Ecto.Schema
  import Ecto.Changeset

  alias Glamm.Gallery.Collection
  alias Glamm.Gallery.ItemValue
  alias Glamm.Master.Authority.Supplier

  schema "gal_items" do
    field :item_code, :string
    field :inventory_code, :string
    field :order_date, :utc_datetime
    field :received_date, :utc_datetime
    field :invoice, :string
    field :invoice_date, :date
    field :item_status, :string
    has_many :item_value, ItemValue
    # field :collection_id, :id
    belongs_to :collection, Collection
    # field :supplier_id, :id
    belongs_to :supplier, Supplier

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(item, attrs) do
    item
    |> cast(attrs, [
      :item_code,
      :inventory_code,
      :order_date,
      :received_date,
      :invoice,
      :invoice_date,
      :item_status,
      :collection_id,
      :supplier_id
    ])
    |> validate_required([
      :item_code,
      :inventory_code,
      :order_date,
      :received_date,
      :invoice,
      :invoice_date,
      :item_status,
      :collection_id,
      :supplier_id
    ])
  end
end
