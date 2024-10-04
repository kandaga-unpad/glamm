defmodule Glamm.Metadata.ResourceTemplate do
  use Ecto.Schema
  import Ecto.Changeset

  alias Glamm.Accounts.User
  alias Glamm.Metadata.ResourceClass
  alias Glamm.Metadata.Property

  schema "resource_template" do
    field :label, :string
    # field :owner_id, :id
    belongs_to :owner, User
    # field :resource_class_id, :id
    belongs_to :resource_class, ResourceClass
    # field :property_id, :id
    belongs_to :property, Property

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(resource_template, attrs) do
    resource_template
    |> cast(attrs, [:label, :owner_id, :resource_class_id, :property_id])
    |> validate_required([:label, :owner_id, :resource_class_id, :property_id])
  end
end
