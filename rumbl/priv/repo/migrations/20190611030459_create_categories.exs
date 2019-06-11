defmodule Rumbl.Repo.Migrations.CreateCategories do
  use Ecto.Migration

  def up do
    create table(:categories) do
      add :name, :string, null: false

      timestamps()
    end

    create unique_index(:categories, [:name])
  end

  def down do
    drop table(:categories)
  end
end
