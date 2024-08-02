defmodule Glamm.Master.Lookup.ItemStatus do
  use Ecto.Schema
  import Ecto.Changeset

  schema "mst_item_status" do
    field :item_status_id, :string
    field :status_name, :string
    field :rules, :string
    field :skip_stock_take, :boolean, default: false

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(item_status, attrs) do
    item_status
    |> cast(attrs, [:item_status_id, :status_name, :rules, :skip_stock_take])
    |> validate_required([:item_status_id, :status_name, :rules, :skip_stock_take])
  end
end
