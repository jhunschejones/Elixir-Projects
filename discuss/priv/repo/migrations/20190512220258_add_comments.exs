defmodule Discuss.Repo.Migrations.AddComments do
  use Ecto.Migration

  def up do
    create table("comments") do
      add :content, :string
      add :user_id, references("users")
      add :topic_id, references("topics")

      timestamps()
    end
  end

  def down do
    drop table("comments")
  end
end
