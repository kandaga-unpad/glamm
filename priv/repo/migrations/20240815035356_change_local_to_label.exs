defmodule Glamm.Repo.Migrations.ChangeLocalToLabel do
  use Ecto.Migration

  def change do
    rename table(:metadata_properties), :local, to: :label
  end
end
