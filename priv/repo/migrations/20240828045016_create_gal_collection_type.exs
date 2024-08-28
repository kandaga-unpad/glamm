defmodule Glamm.Repo.Migrations.CreateGalCollectionType do
  use Ecto.Migration

  def change do
    create table(:gal_collection_type) do
      add :collection_name, :string
      add :description, :text

      timestamps(type: :utc_datetime)
    end
  end
end
