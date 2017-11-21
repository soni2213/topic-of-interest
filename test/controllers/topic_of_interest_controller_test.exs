defmodule ProjectOne.TopicOfInterestControllerTest do
  use ProjectOne.ConnCase

  alias ProjectOne.TopicOfInterest
  @valid_attrs %{short_desc: "some short_desc", name: "some topic_name"}
  @invalid_attrs %{}

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, topic_of_interest_path(conn, :index)
    assert html_response(conn, 200) =~ "Listing topics of interests"
  end

  test "renders form for new resources", %{conn: conn} do
    conn = get conn, topic_of_interest_path(conn, :new)
    assert html_response(conn, 200) =~ "New topic of interest"
  end

  test "creates resource and redirects when data is valid", %{conn: conn} do
    conn = post conn, topic_of_interest_path(conn, :create), topic_of_interest: @valid_attrs
    topic_of_interest = Repo.get_by!(TopicOfInterest, @valid_attrs)
    assert redirected_to(conn) == topic_of_interest_path(conn, :show, topic_of_interest.id)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, topic_of_interest_path(conn, :create), topic_of_interest: @invalid_attrs
    assert html_response(conn, 200) =~ "New topic of interest"
  end

  test "shows chosen resource", %{conn: conn} do
    topic_of_interest = Repo.insert! %TopicOfInterest{}
    conn = get conn, topic_of_interest_path(conn, :show, topic_of_interest)
    assert html_response(conn, 200) =~ "Show topic of interest"
  end

  test "renders page not found when id is nonexistent", %{conn: conn} do
    assert_error_sent 404, fn ->
      get conn, topic_of_interest_path(conn, :show, -1)
    end
  end

  test "renders form for editing chosen resource", %{conn: conn} do
    topic_of_interest = Repo.insert! %TopicOfInterest{}
    conn = get conn, topic_of_interest_path(conn, :edit, topic_of_interest)
    assert html_response(conn, 200) =~ "Edit topic of interest"
  end

  test "updates chosen resource and redirects when data is valid", %{conn: conn} do
    topic_of_interest = Repo.insert! %TopicOfInterest{}
    conn = put conn, topic_of_interest_path(conn, :update, topic_of_interest), topic_of_interest: @valid_attrs
    assert redirected_to(conn) == topic_of_interest_path(conn, :show, topic_of_interest)
    assert Repo.get_by(TopicOfInterest, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    topic_of_interest = Repo.insert! %TopicOfInterest{}
    conn = put conn, topic_of_interest_path(conn, :update, topic_of_interest), topic_of_interest: @invalid_attrs
    assert html_response(conn, 200) =~ "Edit topic of interest"
  end

  test "deletes chosen resource", %{conn: conn} do
    topic_of_interest = Repo.insert! %TopicOfInterest{}
    conn = delete conn, topic_of_interest_path(conn, :delete, topic_of_interest)
    assert redirected_to(conn) == topic_of_interest_path(conn, :index)
    refute Repo.get(TopicOfInterest, topic_of_interest.id)
  end
end
