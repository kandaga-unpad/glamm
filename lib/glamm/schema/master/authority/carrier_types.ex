defmodule Glamm.Master.Authority.CarrierTypes do
  use Ecto.Schema
  import Ecto.Changeset

  schema "mst_carrier_types" do
    field :code, :string
    field :carrier_type, :string
    field :marc_code, :string

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(carrier_types, attrs) do
    carrier_types
    |> cast(attrs, [:carrier_type, :code, :marc_code])
    |> validate_required([:carrier_type, :code, :marc_code])
  end
end
