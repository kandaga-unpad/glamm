defmodule Glamm.Master.Lookup.Language do
  use Ecto.Schema
  import Ecto.Changeset

  schema "mst_language" do
    field :language_name, :string

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(language, attrs) do
    language
    |> cast(attrs, [:language_name])
    |> validate_required([:language_name])
  end
end
