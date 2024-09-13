defmodule Glamm.Gallery.Collection do
  use Ecto.Schema
  import Ecto.Changeset

  alias Glamm.Accounts.User
  alias Glamm.Metadata.ResourceClass
  alias Glamm.Metadata.ResourceTemplate
  alias Glamm.Gallery.Assets
  alias Glamm.Gallery.CollectionType
  alias Glamm.System.Node

  @primary_key {:id, :binary_id, autogenerate: true}
  @derive {Phoenix.Param, key: :id}
  schema "gal_collections" do
    field :title, :string
    field :is_public, :boolean, default: false
    field :view_scope, :string
    # field :owner_id, :id
    belongs_to :owner, User
    # field :resource_class_id, :id
    belongs_to :resource_class, ResourceClass
    # field :resource_template_id, :id
    belongs_to :resource_template, ResourceTemplate
    # field :thumbnail_id, :id
    belongs_to :thumbnail, Assets
    # field :collection_type, :id
    belongs_to :collection_type, CollectionType
    # field :node_id, :id
    belongs_to :node, Node

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(collection, attrs) do
    collection
    |> cast(attrs, [:title, :is_public, :view_scope])
    |> validate_required([:title, :is_public, :view_scope])
  end
end
