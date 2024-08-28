defmodule Glamm.Repo.Migrations.CreateResourceTemplateProperty do
  use Ecto.Migration

  def change do
    create table(:resource_template_property) do
      add :alternate_label, :string
      add :alternate_information, :string
      add :position, :integer
      add :data_type, {:array, :string}
      add :is_required, :boolean, default: false, null: false
      add :is_public, :boolean, default: false, null: false
      add :owner_id, references(:users, on_delete: :nilify_all)
      add :resource_template_id, references(:resource_template, on_delete: :nilify_all)
      add :property_id, references(:metadata_properties, on_delete: :nilify_all)

      timestamps(type: :utc_datetime)
    end

    create index(:resource_template_property, [:owner_id])
    create index(:resource_template_property, [:resource_template_id])
    create index(:resource_template_property, [:property_id])
  end
end
