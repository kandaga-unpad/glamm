defmodule Glamm.Repo.Migrations.CreateMstCreator do
  use Ecto.Migration

  def change do
    create table(:mst_creator) do
      add :creator_name, :string
      add :creator_contact, :text
      add :affiliation, :text
      add :creator_type, :string

      timestamps(type: :utc_datetime)
    end
  end
end
