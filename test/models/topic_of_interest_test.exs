defmodule ProjectOne.TopicOfInterestTest do
  use ProjectOne.ModelCase

  alias ProjectOne.TopicOfInterest

  @valid_attrs %{short_desc: "some short_desc", name: "some topic_name"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = TopicOfInterest.changeset(%TopicOfInterest{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = TopicOfInterest.changeset(%TopicOfInterest{}, @invalid_attrs)
    refute changeset.valid?
  end
end
