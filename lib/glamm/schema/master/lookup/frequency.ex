defmodule Glamm.Master.Lookup.Frequency do
  use Ecto.Schema
  import Ecto.Changeset

  schema "mst_frequency" do
    field :time_unit, :string
    field :frequency, :string
    field :language_prefix, :string
    field :time_increment, :integer

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(frequency, attrs) do
    frequency
    |> cast(attrs, [:frequency, :language_prefix, :time_increment, :time_unit])
    |> validate_required([:frequency, :language_prefix, :time_increment, :time_unit])
  end
end
