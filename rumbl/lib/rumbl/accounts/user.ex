defmodule Rumbl.Accounts.User do
  use Ecto.Schema
  import Ecto.Changeset

  schema "users" do
    field :name, :string
    field :username, :string

    timestamps()
  end

  def changeset(user, attrs) do
    user
    |> cast(attrs, [:name, :username]) # only accepting these two params
    |> validate_required([:name, :username])
    |> validate_length(:username, min: 3, max: 25)
  end
end
