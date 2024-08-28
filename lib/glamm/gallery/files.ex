defmodule Glamm.Gallery.Files do
  use Ecto.Schema
  import Ecto.Changeset

  alias Glamm.Accounts.User

  @primary_key {:id, :binary_id, autogenerate: true}
  @derive {Phoenix.Param, key: :id}

  schema "gal_files" do
    field :file_title, :string
    field :file_type, :string
    field :file_url, :string
    field :file_directory, :string
    field :mime_type, :string
    belongs_to :uploader, User

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(files, attrs) do
    files
    |> cast(attrs, [:id, :file_title, :file_type, :file_url, :file_directory, :mime_type])
    |> validate_required([:id, :file_title, :file_type, :file_url, :file_directory, :mime_type])
  end
end
