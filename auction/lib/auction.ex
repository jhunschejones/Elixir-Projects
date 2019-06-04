defmodule Auction do
  @moduledoc """
  Provides functions for interacting with the database layer of the Auction application.

  In order to keep database concerns separate from the rest of an application, these functions are provided. Any interaction you need to do with the database can be done from within these functions. See an individual function’s documentation for more information and usage examples (like `Auction.get_user_by_username_and_password/2`).
  """

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

  @doc """
  Retrieves a User from the database matching the provided username and password

  ## Return values

  Depending on what is found in the database, two different values could be
  returned:

   * an `Auction.User` struct: An `Auction.User` record was found that matched
   the `username` and `password` that was provided.
   * `false`: No `Auction.User` could be found with the provided `username`
   and `password`.

  You can then use the returned value to determine whether or not the User is
  authorized in your application. If an `Auction.User` is _not_ found based on
  `username`, the computational work of hashing a password is still done.

  ## Examples

      iex> insert_user(%{username: "carl_fox", password: "super_secure", password_confirmation: "super_secure", email_address: "carl@dafoxisdis.com"})
      ...> result = get_user_username_password("carl_fox", "super_secure")
      ...> match?(%Auction.User{username: "carl_fox"}, result)
      true

      iex> get_user_username_password("no_user", "bad_password")
      false
  """
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

  def get_bids_for_user(user) do
    query =
      from b in Bid,
      where: b.user_id == ^user.id, # pin operator access the previously bound value
      order_by: [desc: :inserted_at],
      preload: :item,
      limit: 10
    Repo.all(query)
  end
end
