defmodule Glamm.Metadata.Vocabulary do
  use Ecto.Schema
  import Ecto.Changeset

  alias Glamm.Accounts.User

  schema "metadata_vocabularies" do
    field :label, :string
    field :prefix, :string
    field :namespace_url, :string
    field :information, :string
    # field :owner_id, :id
    belongs_to :owner, User

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(vocabulary, attrs) do
    vocabulary
    |> cast(attrs, [:namespace_url, :prefix, :label, :information, :owner_id])
    |> validate_required([:namespace_url, :prefix, :label, :information, :owner_id])
  end
end
