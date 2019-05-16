defmodule Discuss.Comment do
  use Discuss.Web, :model

  # just JSON encode the comment's content field and the associated user
  @derive {Poison.Encoder, only: [:content, :user]}

  schema "comments" do
    field :content, :string
    belongs_to :user, Discuss.User
    belongs_to :topic, Discuss.Topic

    timestamps()
  end

  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:content]) # use content in params to create new changeset
    |> validate_required([:content])
  end
end
