defmodule Glamm.Repo.Migrations.CreateMstTopics do
  use Ecto.Migration

  def change do
    create table(:mst_topics) do
      add :topic, :string
      add :topic_type, :string
      add :auth_list, :string
      add :classification, :string

      timestamps(type: :utc_datetime)
    end
  end
end
