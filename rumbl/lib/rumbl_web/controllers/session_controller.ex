defmodule RumblWeb.SessionController do
  use RumblWeb, :controller

  # render the login form
  def new(conn, _) do
    render(conn, "new.html")
  end

  # handle login submission
  def create(conn, %{"session" => %{"email" => email, "password" => pass}}) do
    case RumblWeb.Auth.login_email_password(conn, email, pass) do
      {:ok, conn} ->
        conn
        |> put_flash(:info, "Welcome back!")
        |> redirect(to: Routes.page_path(conn, :index))
      {:error, _reason, conn} ->
        conn
        |> put_flash(:error, "Invalid email/password combination.")
        |> render("new.html")
    end
  end

  def delete(conn, _params) do
    conn
    |> RumblWeb.Auth.logout()
    |> redirect(to: Routes.page_path(conn, :index))
  end
end
