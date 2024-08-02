defmodule Glamm.Master.Lookup.Place do
  use Ecto.Schema
  import Ecto.Changeset

  schema "mst_places" do
    field :place_name, :string

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(place, attrs) do
    place
    |> cast(attrs, [:place_name])
    |> validate_required([:place_name])
  end
end
