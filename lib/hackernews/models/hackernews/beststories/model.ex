defmodule HackerNews.Models.HackerNews.BestStories do
  alias __MODULE__.Types
  alias __MODULE__.Queries

  require Logger

  def top(amount \\ 10) do
    Queries.get_top_story_ids(amount)
    |> Queries.get_stories()
    |> Enum.map(fn
      {:error, error} ->
        Logger.error(error)
        nil

      {:ok, response} ->
        Types.Item.decode(response.body)
    end)
    |> Enum.filter(&(&1 != nil))
  end
end
