defmodule Rumbl.TestHelpers do
  alias Rumbl.{Accounts, Multimedia}

  def user_fixture(attrs \\ %{}) do
    username = "test_user_#{System.unique_integer([:positive])}"

    {:ok, user} =
      attrs
      |> Enum.into(%{
        name: "Test User",
        username: username,
        credential: %{
          email: attrs[:email] || "#{username}@testuser.com",
          password: attrs[:password] || "super_secure"
        }
      })
      |> Accounts.register_user()

    user
  end

  def video_fixture(%Accounts.User{} = user, attrs \\ %{}) do
    attrs =
      Enum.into(attrs, %{
        title: "Test Video",
        url: "https://youtu.be/hY7m5jjJ9mM",
        description: "A cat video, of course"
      })
    {:ok, video} = Multimedia.create_video(user, attrs)

    video
  end
end
