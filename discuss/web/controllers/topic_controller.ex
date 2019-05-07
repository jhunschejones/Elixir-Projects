defmodule Discuss.TopicController do
  use Discuss.Web, :controller
  alias Discuss.Topic # allows `Topic` in place of `Discuss.Topic`
  
  def new(conn, _params) do
    # create an empty Ecto.Changeset to use with form
    changeset = Topic.changeset(%Topic{}, %{})

    render conn, "new.html", changeset: changeset
  end

  def create(conn, params) do
    %{"topic" => topic} = params
    changeset = Topic.changeset(%Topic{}, topic)

    case Repo.insert(changeset) do
      {:ok, post} -> IO.inspect post
      {:error, changeset} -> 
        render conn, "new.html", changeset: changeset
    end
  end
end
