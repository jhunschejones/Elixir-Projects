# run with `iex -r basic_auction.ex`
# test drive the functionality of these modules, ex: `Auction.list_items`
defmodule Auction.Item do
  defstruct [:id, :title, :description, :ends_at]
end

defmodule Auction do
  alias Auction.{FakeRepo, Item}

  @repo FakeRepo

  def list_items do
    @repo.all(Item)
  end

  def get_item(id) do
    @repo.get!(Item, id)
  end

  def get_item_by(attrs) do
    @repo.get_by(Item, attrs)
  end
end

defmodule Auction.FakeRepo do
  alias Auction.Item

  @items [
    %Item{
      id: 1,
      title: "DW Performance Series Shells",
      description: "A mid-level drum set, very little wear and tear. Only shells included in listing, sizes 22x18, 10x8, 14x16.",
      ends_at: ~N[2019-06-05 12:00:00]
    },
    %Item{
      id: 2,
      title: "20\" A Custom Crash",
      description: "A warm, shimmering crash with a nice dynamic range. Like new condition.",
      ends_at: ~N[2019-06-05 12:00:00]
    },
    %Item{
      id: 3,
      title: "20\" Byzance Extra Dry Thin Crash",
      description: "A dry crash with short sustain, great alternative to a china for lower volume music! Like new condition.",
      ends_at: ~N[2019-06-05 12:00:00]
    }
  ]

  def all(Item), do: @items

  def get!(Item, id) do
    Enum.find(@items, &(&1.id === id))
  end

  def get_by(Item, attrs) do
    Enum.find(@items, fn(item) ->
      Enum.all?(Map.keys(attrs), fn(key) ->
        Map.get(item, key) === attrs[key]
      end)
    end)
  end
end
