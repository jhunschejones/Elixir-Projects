defmodule Rumbl.Repo.Migrations.AddCategoryIdToVideo do
  use Ecto.Migration

  def up do
    alter table(:videos) do
      add :category_id, references(:categories)
    end
  end

  def down do
    alter table(:videos) do
      remove :category_id
    end
  end
end
