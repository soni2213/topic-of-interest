defmodule ProjectOne.TopicOfInterestController do
  use ProjectOne.Web, :controller

  alias ProjectOne.TopicOfInterest

  def index(conn, _params) do
    topics_of_interests = Repo.all(TopicOfInterest)
    render(conn, "index.html", topics_of_interests: topics_of_interests)
  end

  def new(conn, _params) do
    changeset = TopicOfInterest.changeset(%TopicOfInterest{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"topic_of_interest" => topic_of_interest_params}) do
    changeset = TopicOfInterest.changeset(%TopicOfInterest{}, topic_of_interest_params)

    case Repo.insert(changeset) do
      {:ok, topic_of_interest} ->
        conn
        |> put_flash(:info, "Topic of interest created successfully.")
        |> redirect(to: topic_of_interest_path(conn, :show, topic_of_interest))
      {:error, changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    topic_of_interest = Repo.get!(TopicOfInterest, id)
    render(conn, "show.html", topic_of_interest: topic_of_interest)
  end

  def edit(conn, %{"id" => id}) do
    topic_of_interest = Repo.get!(TopicOfInterest, id)
    changeset = TopicOfInterest.changeset(topic_of_interest)
    render(conn, "edit.html", topic_of_interest: topic_of_interest, changeset: changeset)
  end

  def update(conn, %{"id" => id, "topic_of_interest" => topic_of_interest_params}) do
    topic_of_interest = Repo.get!(TopicOfInterest, id)
    changeset = TopicOfInterest.changeset(topic_of_interest, topic_of_interest_params)

    case Repo.update(changeset) do
      {:ok, topic_of_interest} ->
        conn
        |> put_flash(:info, "Topic of interest updated successfully.")
        |> redirect(to: topic_of_interest_path(conn, :show, topic_of_interest))
      {:error, changeset} ->
        render(conn, "edit.html", topic_of_interest: topic_of_interest, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    topic_of_interest = Repo.get!(TopicOfInterest, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(topic_of_interest)

    conn
    |> put_flash(:info, "Topic of interest deleted successfully.")
    |> redirect(to: topic_of_interest_path(conn, :index))
  end
end
