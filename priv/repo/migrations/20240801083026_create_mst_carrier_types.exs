defmodule Glamm.Repo.Migrations.CreateMstCarrierTypes do
  use Ecto.Migration

  def change do
    create table(:mst_carrier_types) do
      add :carrier_type, :text
      add :code, :string
      add :marc_code, :string

      timestamps(type: :utc_datetime)
    end
  end
end
