defmodule HackerNewsWeb.HackerNews.Live.BestStories.View.Components.Entry do
  use Surface.Component

  prop url, :string
  prop title, :string
  prop footnote, :string
  prop score, :integer
  prop comment_count, :integer

  def render(assigns) do
    ~F"""
    <div class="entry mt-4">
      <h2 class="entry-title text-xl font-bold dark:text-white"><a class="entry-url" href={@url}>{@title}</a></h2>
      <h3 class="entry-footnote mt-2 text-lg dark:text-white">{@footnote}</h3> <div class="entry-stats flex mt-2">
        <span class="mr-2">🔼</span> <p class="entry-score font-bold">{@score}</p> <span class="mr-2 ml-4">💬</span> <p class="entry-comment-count font-bold">{@comment_count}</p>
      </div>
    </div>
    """
  end
end
