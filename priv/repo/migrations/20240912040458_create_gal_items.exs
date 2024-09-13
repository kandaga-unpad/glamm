defmodule Glamm.Repo.Migrations.CreateGalItems do
  use Ecto.Migration

  def change do
    create table(:gal_items) do
      add :item_code, :string
      add :inventory_code, :string
      add :order_date, :utc_datetime
      add :received_date, :utc_datetime
      add :invoice, :string
      add :invoice_date, :date
      add :item_status, :string
      add :collection_id, references(:gal_collections, type: :uuid, on_delete: :delete_all)
      add :supplier_id, references(:mst_suppliers, on_delete: :delete_all)

      timestamps(type: :utc_datetime)
    end

    create index(:gal_items, [:collection_id])
    create index(:gal_items, [:supplier_id])
    create index(:gal_items, [:item_status])
  end
end
