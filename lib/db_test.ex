defmodule DBTest do
  def connect do
    config = [
      username: "postgres",
      password: "mysteryCard@18",
      database: "live_graphix_dev",
      hostname: "localhost",
      port: 5432
    ]

    case Postgrex.start_link(config) do
      {:ok, pid} ->
        IO.puts("Successfully connected to the database")
        Process.exit(pid, :normal)

      {:error, reason} ->
        IO.puts("Failed to connect to the database: #{inspect(reason)}")
    end
  end
end
