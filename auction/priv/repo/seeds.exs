# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Auction.Repo.insert!(%Auction.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

Auction.Repo.insert!(
  %Auction.Item{
    title: "DW Performance Series Shells",
    description: "A warm, shimmering crash with a nice dynamic range. Like new condition.",
    ends_at: DateTime.from_naive!(~N[2019-06-05 12:00:00], "Etc/UTC")
  }
)

Auction.Repo.insert!(
  %Auction.Item{
    title: "20\" A Custom Crash",
    description: "A warm, shimmering crash with a nice dynamic range. Like new condition.",
    ends_at: DateTime.from_naive!(~N[2019-06-05 12:00:00], "Etc/UTC")
  }
)

Auction.Repo.insert!(
  %Auction.Item{
    title: "20\" Byzance Extra Dry Thin Crash",
    description: "A dry crash with short sustain, great alternative to a china for lower volume music! Like new condition.",
    ends_at: DateTime.from_naive!(~N[2019-06-05 12:00:00], "Etc/UTC")
  }
)
