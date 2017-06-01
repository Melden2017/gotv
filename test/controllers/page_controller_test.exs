defmodule Gotv.PageControllerTest do
  use Gotv.ConnCase

  test "GET /", %{conn: conn} do
    conn = get conn, "/"
    assert html_response(conn, 200) =~ "Get out the vote!"
  end
end
