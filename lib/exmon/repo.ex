defmodule Exmon.Repo do
  use Ecto.Repo,
    otp_app: :exmon,
    adapter: Ecto.Adapters.Postgres
end
