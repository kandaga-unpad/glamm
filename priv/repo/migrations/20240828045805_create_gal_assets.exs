defmodule Glamm.Repo.Migrations.CreateGalAssets do
  use Ecto.Migration

  def change do
    create table(:gal_assets, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :file_name, :string
      add :description, :text
      add :uploader_id, references(:users, on_delete: :nilify_all)

      timestamps(type: :utc_datetime)
    end

    create index(:gal_assets, [:uploader_id])
  end
end
