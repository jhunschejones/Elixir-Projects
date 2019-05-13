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
alias Discuss.Comment
alias Discuss.Repo

seed_user = Repo.insert! %User{
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
  user_id: seed_user.id
}

seed_topic_3 = Repo.insert! %Topic{
  title: "Complex Associations in ActiveRecord",
  user_id: seed_user.id
}

seed_topic_4 = Repo.insert! %Topic{
  title: "Phoenix and User Authentication",
  user_id: seed_user.id
}

Repo.insert! %Comment{
  content: "I find Phoenix's plug patter especially helpful for user authentication.",
  user_id: seed_user.id,
  topic_id: seed_topic_4.id
}

Repo.insert! %Comment{
  content: "Self-refrencing, non-directed many-to-many relationships are difficult in ActiveRecord",
  user_id: seed_user.id,
  topic_id: seed_topic_3.id
}

Repo.insert! %Comment{
  content: "I agree! So far I have just been using raw SQL when I get to that point.",
  user_id: seed_user.id,
  topic_id: seed_topic_3.id
}

Repo.insert! %Comment{
  content: "That's probably what I'll have to do. Any tips for the best way to apply that idea without breaking too many of Rails' conventions?",
  user_id: seed_user.id,
  topic_id: seed_topic_3.id
}
