defmodule Glamm.Metadata.ResourceClass do
  use Ecto.Schema
  import Ecto.Changeset

  alias Glamm.Accounts.User
  alias Glamm.Metadata.Vocabulary

  schema "resource_class" do
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
  def changeset(resource_class, attrs) do
    resource_class
    |> cast(attrs, [:local_name, :label, :information, :owner_id, :vocabulary_id])
    |> validate_required([:local_name, :label, :information, :vocabulary_id])
  end
end
