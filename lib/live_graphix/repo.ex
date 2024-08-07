defmodule LiveGraphix.Repo do
  use Ecto.Repo,
    otp_app: :live_graphix,
    adapter: Ecto.Adapters.Postgres
end
