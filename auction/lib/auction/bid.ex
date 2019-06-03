defmodule Auction.Bid do
  use Ecto.Schema
  import Ecto.Changeset

  schema "bids" do
    field :amount, :integer
    belongs_to :item, Auction.Item
    belongs_to :user, Auction.User
    timestamps()
  end

  def changeset(bid, params \\ %{}) do
    bid
    |> cast(params, [:amount, :user_id, :item_id])
    |> validate_required([:amount, :user_id, :item_id])
    |> assoc_constraint(:item) # fails if specified item does not exixst
    |> assoc_constraint(:user) # fails if specified user does not exixst
  end
end
