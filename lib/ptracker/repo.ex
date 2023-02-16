defmodule Ptracker.Repo do
  use Ecto.Repo,
    otp_app: :ptracker,
    adapter: Ecto.Adapters.Postgres
end
