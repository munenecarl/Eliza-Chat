defmodule ElizaChatV3.Repo do
  use Ecto.Repo,
    otp_app: :eliza_chat_v3,
    adapter: Ecto.Adapters.Postgres
end
