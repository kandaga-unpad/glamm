defmodule Glamm.Repo.Migrations.CreateMstLabels do
  use Ecto.Migration

  def change do
    create table(:mst_labels) do
      add :label_name, :string
      add :label_description, :text
      add :label_icon, :string

      timestamps(type: :utc_datetime)
    end
  end
end
