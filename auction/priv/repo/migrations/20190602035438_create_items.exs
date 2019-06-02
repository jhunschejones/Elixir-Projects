defmodule Auction.Repo.Migrations.CreateItems do
  use Ecto.Migration

  def up do
    create table "items" do
      add :title, :string
      add :description, :string
      add :ends_at, :utc_datetime
      timestamps()
    end
  end

  def down do
    drop table "items"
  end
end
