defmodule HackerNews.Repo do
  use Ecto.Repo,
    otp_app: :HackerNews,
    adapter: Ecto.Adapters.SQLite3
end
