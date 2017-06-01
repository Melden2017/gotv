defmodule Gotv.SubscriberControllerTest do
  use Gotv.ConnCase

  alias Gotv.Subscriber
  @valid_attrs %{email_address: "jimmy@zeppelin.com", first_name: "Jimmy",
                 last_name: "Page"}

  test "creates resource and redirects when data is valid", %{conn: conn} do
    conn = post conn, subscriber_path(conn, :create), subscriber: @valid_attrs
    assert redirected_to(conn) == page_path(conn, :index)
    assert Repo.get_by(Subscriber, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, subscriber_path(conn, :create), subscriber: %{email_address: ""}
    assert html_response(conn, 200) =~ "Oops, something went wrong!"
  end
end
