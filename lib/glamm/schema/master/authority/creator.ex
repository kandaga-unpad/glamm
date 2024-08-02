defmodule Glamm.Master.Authority.Creator do
  use Ecto.Schema
  import Ecto.Changeset

  schema "mst_creator" do
    field :creator_name, :string
    field :creator_contact, :string
    field :affiliation, :string
    field :creator_type, Ecto.Enum, values: [:people, :organization, :conferences]

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(creator, attrs) do
    creator
    |> cast(attrs, [:creator_name, :creator_contact, :affiliation, :creator_type])
    |> validate_required([:creator_name, :creator_contact, :affiliation, :creator_type])
  end
end
