defmodule Discuss.User do
  use Discuss.Web, :model

  # just JSON encode the user's email field
  @derive {Poison.Encoder, only: [:email]}

  schema "users" do
    field :email, :string
    field :provider, :string
    field :token, :string
    has_many :topics, Discuss.Topic
    has_many :comments, Discuss.Comment

    timestamps()
  end

  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:email, :provider, :token])  # specifying which params to include in Ecto.Chageset
    |> validate_required([:email, :provider, :token])
    |> unique_constraint(:email)
  end
end
