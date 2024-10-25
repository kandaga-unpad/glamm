defmodule Glamm.Repo.Migrations.CreateGalFiles do
  use Ecto.Migration

  def change do
    create table(:gal_files, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :file_title, :string
      add :file_type, :string
      add :file_url, :text
      add :file_directory, :string
      add :mime_type, :string
      add :uploader_id, references(:users, on_delete: :nilify_all)

      timestamps(type: :utc_datetime)
    end

    create index(:gal_files, [:uploader_id])
  end
end
