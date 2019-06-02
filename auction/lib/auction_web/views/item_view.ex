defmodule AuctionWeb.ItemView do
  use AuctionWeb, :view

  def t, do: DateTime.utc_now
end
