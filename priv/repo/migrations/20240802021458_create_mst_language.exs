defmodule Glamm.Repo.Migrations.CreateMstLanguage do
  use Ecto.Migration

  def change do
    create table(:mst_language) do
      add :language_name, :string

      timestamps(type: :utc_datetime)
    end
  end
end
