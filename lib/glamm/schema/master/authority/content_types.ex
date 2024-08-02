defmodule Glamm.Master.Authority.ContentTypes do
  use Ecto.Schema
  import Ecto.Changeset

  schema "mst_content_types" do
    field :code, :string
    field :content_type, :string
    field :mar_code, :string

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(content_types, attrs) do
    content_types
    |> cast(attrs, [:content_type, :code, :mar_code])
    |> validate_required([:content_type, :code, :mar_code])
  end
end
