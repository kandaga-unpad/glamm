defmodule Glamm.Repo.Migrations.CreateMetadataVocabularies do
  use Ecto.Migration

  def change do
    create table(:metadata_vocabularies) do
      add :namespace_url, :string
      add :prefix, :string
      add :label, :string
      add :information, :text
      add :owner_id, references(:users)

      timestamps(type: :utc_datetime)
    end

    create index(:metadata_vocabularies, [:owner_id])
  end
end
