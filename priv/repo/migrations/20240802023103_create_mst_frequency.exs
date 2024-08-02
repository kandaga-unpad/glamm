defmodule Glamm.Repo.Migrations.CreateMstFrequency do
  use Ecto.Migration

  def change do
    create table(:mst_frequency) do
      add :frequency, :string
      add :language_prefix, :string
      add :time_increment, :integer
      add :time_unit, :string

      timestamps(type: :utc_datetime)
    end
  end
end
