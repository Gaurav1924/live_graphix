defmodule LiveGraphixWeb.Endpoint do
  use Phoenix.Endpoint, otp_app: :live_graphix

  # Session options and socket configuration
  @session_options [
    store: :cookie,
    key: "_live_graphix_key",
    signing_salt: "oUozeO0V",
    same_site: "Lax"
  ]

  socket "/live", Phoenix.LiveView.Socket,
    websocket: [connect_info: [session: @session_options]],
    longpoll: [connect_info: [session: @session_options]]

  # Static file serving
  plug Plug.Static,
    at: "/",
    from: :live_graphix,
    gzip: false,
    only: LiveGraphixWeb.static_paths()

  # Configure channels
  socket "/socket", LiveGraphixWeb.UserSocket,
    websocket: true,
    longpoll: false

  # Additional plugs for development
  if code_reloading? do
    socket "/phoenix/live_reload/socket", Phoenix.LiveReloader.Socket
    plug Phoenix.LiveReloader
    plug Phoenix.CodeReloader
    plug Phoenix.Ecto.CheckRepoStatus, otp_app: :live_graphix
  end

  plug Phoenix.LiveDashboard.RequestLogger,
    param_key: "request_logger",
    cookie_key: "request_logger"

  plug Plug.RequestId
  plug Plug.Telemetry, event_prefix: [:phoenix, :endpoint]

  plug Plug.Parsers,
    parsers: [:urlencoded, :multipart, :json],
    pass: ["*/*"],
    json_decoder: Phoenix.json_library()

  plug Plug.MethodOverride
  plug Plug.Head
  plug Plug.Session, @session_options
  plug LiveGraphixWeb.Router
end
