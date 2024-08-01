defmodule Glamm.Repo.Migrations.CreateMstMediaTypes do
  use Ecto.Migration

  def change do
    create table(:mst_media_types) do
      add :media_type, :text
      add :code, :string
      add :marc_code, :string

      timestamps(type: :utc_datetime)
    end
  end
end
