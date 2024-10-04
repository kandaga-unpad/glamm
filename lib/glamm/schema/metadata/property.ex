defmodule Glamm.Metadata.Property do
  use Ecto.Schema
  import Ecto.Changeset

  alias Glamm.Accounts.User
  alias Glamm.Metadata.Vocabulary

  schema "metadata_properties" do
    field :label, :string
    field :local_name, :string
    field :information, :string
    # field :owner_id, :id
    belongs_to :owner, User
    # field :vocabulary_id, :id
    belongs_to :vocabulary, Vocabulary

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(property, attrs) do
    property
    |> cast(attrs, [:local_name, :label, :information, :owner_id, :vocabulary_id])
    |> validate_required([:local_name, :label, :information, :owner_id, :vocabulary_id])
  end
end
