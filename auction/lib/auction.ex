defmodule Auction do
  alias Auction.{Repo, Item, User, Password, Bid}
  import Ecto.Query

  def list_items do
    Item
    |> order_by({:asc, :id})
    |> Repo.all
  end

  def get_item(id) do
    Repo.get!(Item, id)
  end

  def get_item_with_bids(id) do
    id
    |> get_item # reusing function above!
    |> Repo.preload(bids: [:user]) # preload bids for this item and the users for those bids
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

  def get_user(id), do: Repo.get!(User, id)

  # return empty changeset for new user form
  def new_user, do: User.changeset_with_password(%User{})

  def insert_user(params) do
    %User{}
    |> User.changeset_with_password(params)
    |> Repo.insert
  end

  def get_user_username_password(username, password) do
    with user when not is_nil(user) <- Repo.get_by(User, %{username: username}),
      true <- Password.verify_with_hash(password, user.hashed_password) do
        user
    else
      _ -> Password.dummy_verify
    end
  end

  # generate empty Bid changeset for new-bid form
  def new_bid, do: Bid.changeset(%Bid{})

  def insert_bid(params) do
    %Bid{}
    |> Bid.changeset(params)
    |> Repo.insert
  end
end
