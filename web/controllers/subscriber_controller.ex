defmodule Gotv.SubscriberController do
  use Gotv.Web, :controller

  alias Gotv.Subscriber

  def create(conn, %{"subscriber" => subscriber_params}) do
    changeset = Subscriber.changeset(%Subscriber{}, subscriber_params)
    Repo.insert(changeset)
    conn |> redirect(to: page_path(conn, :index))
  end
end
