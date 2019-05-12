defmodule Discuss.Plugs.RequireAuth do
  import Plug.Conn
  import Phoenix.Controller

  alias Discuss.Router.Helpers

  def init(_params) do
  end

  def call(conn, _params) do
    if conn.assigns[:user] do
      conn
    else
      conn
      |> put_flash(:error, "You Must Be Logged In")
      |> redirect(to: Helpers.topic_path(conn, :index))
      |> halt() # do not pass along the connection
    end
  end
end
