defmodule Glamm.Repo.Migrations.CreateGalRequisitions do
  use Ecto.Migration

  def change do
    create table(:gal_requisitions, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :member_name, :string
      add :identifier, :string
      add :title, :text
      add :creator, :text
      add :owner, :text
      add :year_created, :integer
      add :description, :text
      add :price_currency, :string
      add :price, :integer
      add :information, :text
      add :req_state, :string
      add :member_id, references(:users), null: false

      timestamps(type: :utc_datetime)
    end

    create index(:gal_requisitions, [:member_id])
  end
end
