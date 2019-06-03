defmodule Auction.Repo.Migrations.CreateUsers do
  use Ecto.Migration

  def up do
    create table "users" do
      add :username, :string
      add :email_address, :string
      add :hashed_password, :string
      timestamps()
    end

    create unique_index("users", [:username])
  end

  def down do
    drop table "users"
  end
end
