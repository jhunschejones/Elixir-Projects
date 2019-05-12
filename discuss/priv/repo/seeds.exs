# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Discuss.Repo.insert!(%Discuss.SomeModel{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

alias Discuss.User
alias Discuss.Topic
alias Discuss.Repo

Repo.insert! %User{
  email: "joshua@hunschejones.com",
  provider: "github",
  token: ""
}

# topic with no associated user
Repo.insert! %Topic{
  title: "Elixir Lang Fundamentals"
}

Repo.insert! %Topic{
  title: "Node.js: Fun With Server-Side JavaScript",
  user_id: 1
}

Repo.insert! %Topic{
  title: "Complex Associations in ActiveRecord",
  user_id: 1
}

Repo.insert! %Topic{
  title: "Phoenix and User Authentication",
  user_id: 1
}
