# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :hello_phoenix,
  ecto_repos: [HelloPhoenix.Repo]

# Configures the endpoint
config :hello_phoenix, HelloPhoenix.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "MxtEEGNPpNzXOlNhxMFRq0VunWFQ8c26MowvDc2UWN+aGxwjjA1B33uIeHs1j3Pl",
  render_errors: [view: HelloPhoenix.ErrorView, accepts: ~w(html json)],
  pubsub: [name: HelloPhoenix.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

config :guardian, Guardian,
  allowed_algos: ["HS512"],
  verify_module: Guardian.JWS,
  issuer: "HelloPhoenix",
  ttl: {30, :days},
  verify_issuer: true,
  secret_key: "0ddf5597e02d981f8803c4cc11f015a4e52679d706edb29b595d9e466def5bcf95273a3053ab5d97ee893c23e4023b912daefaade316406a33b7685d4d223dfa",
  serializer: MyApp.GuardianSerializer

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
