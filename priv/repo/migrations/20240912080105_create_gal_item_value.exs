defmodule Glamm.Repo.Migrations.CreateGalItemValue do
  use Ecto.Migration

  def change do
    create table(:gal_item_value, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :type, :string
      add :lang, :string
      add :value, :text
      add :url, :text
      add :scope_view, :string
      add :collection_id, references(:gal_collections, type: :binary_id, on_delete: :delete_all)
      add :item_id, references(:gal_items, on_delete: :delete_all)
      add :property_id, references(:metadata_properties, on_delete: :delete_all)

      timestamps(type: :utc_datetime)
    end

    create index(:gal_item_value, [:collection_id])
    create index(:gal_item_value, [:item_id])
    create index(:gal_item_value, [:property_id])
  end
end
