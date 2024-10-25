defmodule Glamm.Repo.Migrations.CreateGalCollections do
  use Ecto.Migration

  def change do
    create table(:gal_collections, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :title, :text
      add :is_public, :boolean, default: false, null: false
      add :view_scope, :string
      add :owner_id, references(:users, on_delete: :delete_all)
      add :resource_class_id, references(:resource_class, on_delete: :delete_all)
      add :resource_template_id, references(:resource_template, on_delete: :delete_all)
      add :thumbnail_id, references(:gal_assets, on_delete: :delete_all, type: :binary_id)
      add :collection_type_id, references(:gal_collection_type, on_delete: :delete_all)
      add :node_id, references(:nodes, on_delete: :delete_all)

      timestamps(type: :utc_datetime)
    end

    create index(:gal_collections, [:owner_id])
    create index(:gal_collections, [:resource_class_id])
    create index(:gal_collections, [:resource_template_id])
    create index(:gal_collections, [:thumbnail_id])
    create index(:gal_collections, [:collection_type_id])
    create index(:gal_collections, [:node_id])
  end
end
