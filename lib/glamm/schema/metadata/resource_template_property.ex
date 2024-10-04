defmodule Glamm.Metadata.ResourceTemplateProperty do
  use Ecto.Schema
  import Ecto.Changeset

  alias Glamm.Accounts.User
  alias Glamm.Metadata.ResourceTemplate
  alias Glamm.Metadata.Property

  schema "resource_template_property" do
    field :position, :integer
    field :data_type, {:array, :string}
    field :alternate_label, :string
    field :alternate_information, :string
    field :is_required, :boolean, default: false
    field :is_public, :boolean, default: false
    # field :owner_id, :id
    belongs_to :owner, User
    # field :resource_template_id, :id
    belongs_to :resource_template, ResourceTemplate
    # field :property_id, :id
    belongs_to :property, Property

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(resource_template_property, attrs) do
    resource_template_property
    |> cast(attrs, [
      :alternate_label,
      :alternate_information,
      :position,
      :data_type,
      :is_required,
      :is_public,
      :owner_id,
      :resource_template_id,
      :property_id
    ])
    |> validate_required([
      :alternate_label,
      :alternate_information,
      :position,
      :data_type,
      :is_required,
      :is_public,
      :owner_id,
      :resource_template_id,
      :property_id
    ])
  end
end
