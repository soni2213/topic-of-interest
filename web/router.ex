defmodule ProjectOne.Router do
  use ProjectOne.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", ProjectOne do
    pipe_through :browser # Use the default browser stack

    resources "/users", UserController # for user actions.
    resources "/topics_of_interests", TopicOfInterestController # for topic of interests.

    get "/", PageController, :index
  end

  # Other scopes may use custom stacks.
  # scope "/api", ProjectOne do
  #   pipe_through :api
  # end
end
