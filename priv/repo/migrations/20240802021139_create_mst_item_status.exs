defmodule Glamm.Repo.Migrations.CreateMstItemStatus do
  use Ecto.Migration

  def change do
    create table(:mst_item_status) do
      add :item_status_id, :string
      add :status_name, :string
      add :rules, :text
      add :skip_stock_take, :boolean, default: false, null: false

      timestamps(type: :utc_datetime)
    end
  end
end
