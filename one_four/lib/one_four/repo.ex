defmodule OneFour.Repo do
  use Ecto.Repo,
    otp_app: :one_four,
    adapter: Ecto.Adapters.Postgres
end
