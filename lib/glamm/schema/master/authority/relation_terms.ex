defmodule Glamm.Master.Authority.RelationTerms do
  use Ecto.Schema
  import Ecto.Changeset

  schema "mst_relation_terms" do
    field :rt_code, :string
    field :rt_description, :string

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(relation_terms, attrs) do
    relation_terms
    |> cast(attrs, [:rt_code, :rt_description])
    |> validate_required([:rt_code, :rt_description])
  end
end
