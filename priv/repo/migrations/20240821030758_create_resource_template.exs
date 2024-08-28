defmodule Glamm.Repo.Migrations.CreateResourceTemplate do
  use Ecto.Migration

  def change do
    create table(:resource_template) do
      add :label, :string
      add :owner_id, references(:users, on_delete: :nilify_all)
      add :resource_class_id, references(:resource_class, on_delete: :nilify_all)
      add :property_id, references(:metadata_properties, on_delete: :nilify_all)

      timestamps(type: :utc_datetime)
    end

    create index(:resource_template, [:owner_id])
    create index(:resource_template, [:resource_class_id])
    create index(:resource_template, [:property_id])
  end
end
