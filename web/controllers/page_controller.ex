defmodule Gotv.PageController do
  use Gotv.Web, :controller

  alias Gotv.Subscriber

  def index(conn, _params) do
    changeset = Subscriber.changeset(%Subscriber{})
    render conn, "index.html", changeset: changeset
  end
end
