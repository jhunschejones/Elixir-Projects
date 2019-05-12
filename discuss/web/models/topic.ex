defmodule Discuss.Topic do
  use Discuss.Web, :model

  schema "topics" do
    field :title, :string
    belongs_to :user, Discuss.User
  end

  # struct argument is a record to be entered into the database
  # params argument represents properties we want to update the struct with
  # entire function returns an Ecto.Changeset to update the database, including
  # a `valid?: boolean` response and any errors from failed validation steps
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:title]) # produces an Ecto.Changeset with this param
    |> validate_required([:title]) # checks if Ecto.Changeset is valid
  end
end
