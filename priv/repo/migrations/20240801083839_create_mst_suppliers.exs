defmodule Glamm.Repo.Migrations.CreateMstSuppliers do
  use Ecto.Migration

  def change do
    create table(:mst_suppliers) do
      add :supplier_name, :string
      add :address, :text
      add :postal_code, :integer
      add :phone, :string
      add :contact, :string
      add :fax, :string
      add :account, :string
      add :email, :string

      timestamps(type: :utc_datetime)
    end
  end
end
