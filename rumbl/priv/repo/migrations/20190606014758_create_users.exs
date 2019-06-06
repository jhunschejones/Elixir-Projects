defmodule Rumbl.Repo.Migrations.CreateUsers do
  use Ecto.Migration

  def up do
    create table(:users) do
      add :name, :string
      add :username, :string, null: false

      timestamps()
    end

    create unique_index(:users, [:username])
  end

  def down do
    drop table(:users)
  end
end
