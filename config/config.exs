# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :project_one,
  ecto_repos: [ProjectOne.Repo]

# Configures the endpoint
config :project_one, ProjectOne.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "byTI2Nerc0oyCwM8m5/6CHptPW/vDpIBtT2P+1GB3PUAxbys8UfSWTo6fCYjmT2a",
  render_errors: [view: ProjectOne.ErrorView, accepts: ~w(html json)],
  pubsub: [name: ProjectOne.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
