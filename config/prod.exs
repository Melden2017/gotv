use Mix.Config

config :gotv, Gotv.Endpoint,
  http: [port: {:system, "PORT"}],
  url: [scheme: "http", host: "www.toledogo.tv", port: 80],
  cache_static_manifest: "priv/static/manifest.json",
  secret_key_base: System.get_env("SECRET_KEY_BASE")

# Configure your database
config :gotv, Gotv.Repo,
  adapter: Ecto.Adapters.Postgres,
  url: System.get_env("DATABASE_URL"),
  pool_size: String.to_integer(System.get_env("POOL_SIZE") || "10"),
  ssl: true

# Do not print debug messages in production
config :logger, level: :info
