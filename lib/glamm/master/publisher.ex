defmodule Glamm.Master.Publisher do
  use Ecto.Schema
  import Ecto.Changeset

  schema "mst_publishers" do
    field :place_name, :string

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(publisher, attrs) do
    publisher
    |> cast(attrs, [:place_name])
    |> validate_required([:place_name])
  end
end
