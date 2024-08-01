defmodule Glamm.Repo.Migrations.CreateMstPublishers do
  use Ecto.Migration

  def change do
    create table(:mst_publishers) do
      add :place_name, :string

      timestamps(type: :utc_datetime)
    end
  end
end
