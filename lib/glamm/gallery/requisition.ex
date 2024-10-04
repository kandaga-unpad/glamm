defmodule Glamm.Gallery.Requisition do
  use Ecto.Schema
  import Ecto.Changeset

  alias Glamm.Accounts.User

  @primary_key {:id, :binary_id, autogenerate: true}
  @derive {Phoenix.Param, key: :id}
  schema "gal_requisitions" do
    field :owner, :string
    field :description, :string
    field :title, :string
    field :identifier, :string
    field :member_name, :string
    field :creator, :string
    field :year_created, :integer
    field :price_currency, :string
    field :price, :integer
    field :information, :string
    field :req_state, :string
    belongs_to :member, User

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(requisition, attrs) do
    requisition
    |> cast(attrs, [
      :member_name,
      :identifier,
      :title,
      :creator,
      :owner,
      :year_created,
      :description,
      :price_currency,
      :price,
      :information,
      :req_state,
      :member_id
    ])
    |> validate_required([
      :member_name,
      :identifier,
      :title,
      :creator,
      :owner,
      :year_created,
      :description,
      :price_currency,
      :price,
      :information,
      :req_state,
      :member_id
    ])
  end
end
