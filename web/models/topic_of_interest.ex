defmodule ProjectOne.TopicOfInterest do
  use ProjectOne.Web, :model

  schema "topics_of_interests" do
    field :name, :string
    field :short_desc, :string
    many_to_many :users, ProjectOne.User, join_through: "users_interests"

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:name, :short_desc])
    |> validate_required([:name, :short_desc])
  end
end
