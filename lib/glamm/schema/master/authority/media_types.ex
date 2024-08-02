defmodule Glamm.Master.Authority.MediaTypes do
  use Ecto.Schema
  import Ecto.Changeset

  schema "mst_media_types" do
    field :code, :string
    field :media_type, :string
    field :marc_code, :string

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(media_types, attrs) do
    media_types
    |> cast(attrs, [:media_type, :code, :marc_code])
    |> validate_required([:media_type, :code, :marc_code])
  end
end
