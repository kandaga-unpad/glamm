defmodule Glamm.Repo do
  use Ecto.Repo,
    otp_app: :glamm,
    adapter: Ecto.Adapters.Postgres
end
