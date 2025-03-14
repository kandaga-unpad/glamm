defmodule Glamm.Repo.Migrations.CreateResourceClass do
  use Ecto.Migration

  def change do
    create table(:resource_class) do
      add :local_name, :string
      add :label, :string
      add :information, :text
      add :owner_id, references(:users)
      add :vocabulary_id, references(:metadata_vocabularies)

      timestamps(type: :utc_datetime)
    end

    create index(:resource_class, [:owner_id])
    create index(:resource_class, [:vocabulary_id])
  end
end
