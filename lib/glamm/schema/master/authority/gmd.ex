defmodule Glamm.Master.Authority.GMD do
  use Ecto.Schema
  import Ecto.Changeset

  schema "mst_gmd" do
    field :gmd_code, :string
    field :gmd_name, :string
    field :icon_image, :string

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(gmd, attrs) do
    gmd
    |> cast(attrs, [:gmd_code, :gmd_name, :icon_image])
    |> validate_required([:gmd_code, :gmd_name, :icon_image])
  end
end
