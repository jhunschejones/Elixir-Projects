defmodule Rumbl.Repo.Migrations.CreateCredentials do
  use Ecto.Migration

  def up do
    create table(:credentials) do
      add :email, :string, null: false
      add :password_hash, :string, null: false
      add :user_id, references(:users, on_delete: :delete_all), null: false # delete associated credentials when a user is deleted

      timestamps()
    end
  end

  def down do
    drop table(:credentials)
  end
end
