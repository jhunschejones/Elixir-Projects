defmodule Discuss.CommentsChannel do
  use Discuss.Web, :channel
  alias Discuss.Topic

  def join("comments:" <> topic_id, _params, socket) do
    topic = Repo.get(Topic, String.to_integer(topic_id))

    # second argument has to be a map, NOT a full Topic struct
    {:ok, %{id: topic.id, title: topic.title}, socket}
  end

  def handle_in(name, message, socket) do
    {:reply, :ok, socket}
  end
end
