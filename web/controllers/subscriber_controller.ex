defmodule Gotv.SubscriberController do
  use Gotv.Web, :controller

  alias Gotv.Subscriber

  def create(conn, %{"subscriber" => subscriber_params}) do
    changeset = Subscriber.changeset(%Subscriber{}, subscriber_params)
    case Repo.insert(changeset) do
      {:ok, _subscriber} ->
        conn
        |> put_flash(:info, "You have subscribed successfully and you will receive email reminders to vote!")
        |> redirect(to: page_path(conn, :index))
      {:error, changeset} ->
        render(conn, Gotv.PageView, "index.html", changeset: changeset)
    end
  end
end
