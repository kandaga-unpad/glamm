defmodule Glamm.Repo.Migrations.CreateMstGmd do
  use Ecto.Migration

  def change do
    create table(:mst_gmd) do
      add :gmd_code, :string
      add :gmd_name, :string
      add :icon_image, :string

      timestamps(type: :utc_datetime)
    end
  end
end
