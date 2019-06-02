defmodule Auction do
  alias Auction.{Repo, Item}
  import Ecto.Query

  def list_items do
    Item
    |> order_by({:asc, :id})
    |> Repo.all
  end

  def get_item(id) do
    Repo.get!(Item, id)
  end

  def get_item_by(attrs) do
    Repo.get_by(Item, attrs)
  end

  # return empty changeset for new item form
  def new_item, do: Item.changeset(%Item{})

  def insert_item(attrs) do
    %Item{}
    |> Item.changeset(attrs)
    |> Repo.insert
  end

  # return changeset for existing item for edit form
  def edit_item(id) do
    get_item(id)
    |> Item.changeset
  end

  def update_item(%Auction.Item{} = item, updates) do
    item
    |> Item.changeset(updates)
    |> Repo.update
  end

  def delete_item(%Auction.Item{} = item), do: Repo.delete(item)
end
