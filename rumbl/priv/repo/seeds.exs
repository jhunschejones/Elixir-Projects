# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Rumbl.Repo.insert!(%Rumbl.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

alias Rumbl.{Repo, Accounts.User}

Repo.insert(%User{name: "carl", username: "carlfox"})
Repo.insert(%User{name: "daisy", username: "dustybear"})
Repo.insert(%User{name: "penguin", username: "fancypenguin"})
