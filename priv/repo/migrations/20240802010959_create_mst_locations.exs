defmodule Glamm.Repo.Migrations.CreateMstLocations do
  use Ecto.Migration

  def change do
    create table(:mst_locations) do
      add :location_code, :string
      add :location_name, :text
      add :location_place, :text

      timestamps(type: :utc_datetime)
    end
  end
end
