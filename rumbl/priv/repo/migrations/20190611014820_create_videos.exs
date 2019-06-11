defmodule Rumbl.Repo.Migrations.CreateVideos do
  use Ecto.Migration

  def up do
    create table(:videos) do
      add :url, :string
      add :title, :string
      add :description, :text
      add :user_id, references(:users, on_delete: :nothing)

      timestamps()
    end

    create index(:videos, [:user_id])
  end

  def down do
    drop table(:videos)
  end
end
