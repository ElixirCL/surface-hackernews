defmodule HackerNews.Models.HackerNews.BestStories.Types.Item do
  defstruct ~w(id comment_count score author title date url footnote)a

  defp get_footnote(json) do
    url =
      Access.get(json, "url", "")
      |> URI.parse()

    time =
      Access.get(json, "time", System.os_time())
      |> DateTime.from_unix!()

    %{host: url.host, time: time, by: Access.get(json, "by", "unknown")}
  end

  def decode(json) do
    %__MODULE__{
      id: get_in(json, ["id"]),
      comment_count: get_in(json, ["descendants"]),
      score: get_in(json, ["score"]),
      author: get_in(json, ["by"]),
      title: get_in(json, ["title"]),
      date: get_in(json, ["time"]),
      url: get_in(json, ["url"]),
      footnote: get_footnote(json)
    }
  end
end
