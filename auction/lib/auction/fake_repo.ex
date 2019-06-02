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
