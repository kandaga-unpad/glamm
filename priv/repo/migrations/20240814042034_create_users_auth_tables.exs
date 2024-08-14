defmodule Glamm.Repo.Migrations.CreateUsersAuthTables do
  use Ecto.Migration

  def change do
    execute "CREATE EXTENSION IF NOT EXISTS citext", ""

    create table(:users) do
      add :email, :citext, null: false
      add :username, :citext, null: false
      add :fullname, :string
      add :hashed_password, :string, null: false
      add :confirmed_at, :utc_datetime
      add :user_type, :string
      add :user_image, :string
      add :social_media, :string
      add :groups, {:array, :string}
      add :node_id, :integer
      add :last_login, :utc_datetime
      add :last_login_ip, :string

      timestamps(type: :utc_datetime)
    end

    create unique_index(:users, [:email])

    create table(:users_tokens) do
      add :user_id, references(:users, on_delete: :delete_all), null: false
      add :token, :binary, null: false
      add :context, :string, null: false
      add :sent_to, :string

      timestamps(type: :utc_datetime, updated_at: false)
    end

    create index(:users_tokens, [:user_id])
    create unique_index(:users_tokens, [:context, :token])
  end
end
