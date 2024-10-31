defmodule Glamm.Gallery.Assets do
  use Ecto.Schema
  import Ecto.Changeset

  alias Glamm.Accounts.User

  @primary_key {:id, :binary_id, autogenerate: true}
  @derive {Phoenix.Param, key: :id}

  schema "gal_assets" do
    field :description, :string
    field :file_name, :string
    field :path, :string
    belongs_to :uploader, User

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(assets, attrs) do
    assets
    |> cast(attrs, [:id, :file_name, :path, :description, :uploader_id])
    |> validate_required([:file_name, :path, :description])
  end
end
