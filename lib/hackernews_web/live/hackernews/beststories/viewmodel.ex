defmodule HackerNewsWeb.HackerNews.Live.BestStories.ViewModel do
  use Surface.LiveComponent

  alias HackerNewsWeb.HackerNews.Live.BestStories.View.Components.Entry
  alias HackerNews.Models.HackerNews.BestStories

  data entries, :list, default: []

  @impl true
  def mount(socket) do
    socket =
      socket
      |> assign(:entries, BestStories.top())

    {:ok, socket}
  end

  # This function is a small helper to have relative time.
  # To avoid using a library like Timex.
  # Extracted from: https://stackoverflow.com/a/65915005
  # And https://gist.github.com/h00s/b863579ec9c7b8c65311e6862298b7a0
  defp from_now_ago_in_words(later, now \\ DateTime.utc_now()) do
    seconds = DateTime.diff(now, later)
    minutes = round(seconds / 60)

    case minutes do
      minutes when minutes in 0..1 ->
        case seconds do
          seconds when seconds in 0..4 ->
            "less than 5 seconds"

          seconds when seconds in 5..9 ->
            "less than 10 seconds"

          seconds when seconds in 10..19 ->
            "less than 20 seconds"

          seconds when seconds in 20..39 ->
            "half a minute"

          seconds when seconds in 40..59 ->
            "less than 1 minute"

          _ ->
            "1 minute"
        end

      minutes when minutes in 2..44 ->
        "#{minutes} minutes"

      minutes when minutes in 45..89 ->
        "about 1 hour"

      minutes when minutes in 90..1439 ->
        "about #{round(minutes / 60)} hours"

      minutes when minutes in 1440..2519 ->
        "1 day"

      minutes when minutes in 2520..43199 ->
        "#{round(minutes / 1440)} days"

      minutes when minutes in 43200..86399 ->
        "about 1 month"

      minutes when minutes in 86400..525_599 ->
        "#{round(minutes / 43200)} months"

      minutes when minutes in 525_600..1_051_199 ->
        "1 year"

      _ ->
        "#{round(minutes / 525_600)} years"
    end
  end

  def render(assigns) do
    ~F"""
    <div id="beststories">
      <h1 class="text-5xl font-extrabold dark:text-white mb-10">HackerNews Best Stories</h1>
      {#for entry <- @entries}
        <Entry
          url={entry.url}
          title={entry.title}
          footnote={"#{entry.footnote.host} - #{from_now_ago_in_words(entry.footnote.time)} ago by #{entry.footnote.by}"}
          score={entry.score}
          comment_count={entry.comment_count}
        />
      {/for}
    </div>
    """
  end
end
