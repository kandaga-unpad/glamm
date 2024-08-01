defmodule Glamm.Repo.Migrations.CreateMstContentTypes do
  use Ecto.Migration

  def change do
    create table(:mst_content_types) do
      add :content_type, :text
      add :code, :string
      add :mar_code, :string

      timestamps(type: :utc_datetime)
    end
  end
end
