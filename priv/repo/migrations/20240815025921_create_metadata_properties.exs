defmodule Glamm.Repo.Migrations.CreateMetadataProperties do
  use Ecto.Migration

  def change do
    create table(:metadata_properties) do
      add :local_name, :string
      add :local, :string
      add :information, :text
      add :owner_id, references(:users, on_delete: :nilify_all)
      add :vocabulary_id, references(:metadata_vocabularies, on_delete: :nilify_all)

      timestamps(type: :utc_datetime)
    end

    create index(:metadata_properties, [:owner_id])
    create index(:metadata_properties, [:vocabulary_id])
  end
end
