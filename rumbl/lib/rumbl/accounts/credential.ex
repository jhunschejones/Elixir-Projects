defmodule Rumbl.Accounts.Credential do
  use Ecto.Schema
  import Ecto.Changeset
  alias Rumbl.Accounts.User

  schema "credentials" do
    field :email, :string
    field :password, :string, virtual: true # virtual fields exist in the struct but not the database
    field :password_hash, :string
    belongs_to :user, User

    timestamps()
  end

  @doc false
  def changeset(credential, attrs) do
    credential
    |> cast(attrs, [:email, :password])
    |> validate_required([:email, :password])
    |> validate_length(:password, min: 6, max: 40)
    |> unique_constraint(:email)
    |> put_password_hash()
  end

  defp put_password_hash(changeset) do
    case changeset do
      %Ecto.Changeset{valid?: true, changes: %{password: password}} ->
        put_change(changeset, :password_hash, Pbkdf2.hash_pwd_salt(password))
      _ ->
        changeset
    end
  end
end
