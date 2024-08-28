defmodule Glamm.Repo.Migrations.CreateNodes do
  use Ecto.Migration

  def change do
    create table(:nodes) do
      add :name, :string
      add :abbr, :string
      add :groups, :string
      add :image, :text

      timestamps(type: :utc_datetime)
    end
  end
end
