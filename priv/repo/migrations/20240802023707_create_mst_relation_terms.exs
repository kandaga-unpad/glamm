defmodule Glamm.Repo.Migrations.CreateMstRelationTerms do
  use Ecto.Migration

  def change do
    create table(:mst_relation_terms) do
      add :rt_code, :string
      add :rt_description, :text

      timestamps(type: :utc_datetime)
    end
  end
end
