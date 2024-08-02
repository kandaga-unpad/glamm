defmodule Glamm.Master.Lookup.Label do
  use Ecto.Schema
  import Ecto.Changeset

  schema "mst_labels" do
    field :label_name, :string
    field :label_description, :string
    field :label_icon, :string

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(label, attrs) do
    label
    |> cast(attrs, [:label_name, :label_description, :label_icon])
    |> validate_required([:label_name, :label_description, :label_icon])
  end
end
