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

alias Rumbl.{Accounts, Multimedia}

# seed basic categories
for category <- ~w(Action Drama Romance Comedy Sci-fi Animation) do
  Multimedia.create_category(category)
end

if !Accounts.get_user_by(username: "carlfox") do
  Accounts.regiser_user(
    %{credential: %{
      email: "carl@dafoxisdis.com",
      password: "super_secure"
    },
    name: "carl",
    username: "carlfox"
  })
end

if !Accounts.get_user_by(username: "dustybear") do
  Accounts.regiser_user(
    %{credential: %{
      email: "dustybear@dafoxisdis.com",
      password: "super_secure"
    },
    name: "daisy",
    username: "dustybear"
  })
end

if !Accounts.get_user_by(username: "fancypenguin") do
  Accounts.regiser_user(
    %{credential: %{
      email: "penguin@dafoxisdis.com",
      password: "super_secure"
    },
    name: "penguin",
    username: "fancypenguin"
  })
end
