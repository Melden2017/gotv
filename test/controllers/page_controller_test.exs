defmodule Gotv.PageControllerTest do
  use Gotv.ConnCase

  test "GET /", %{conn: conn} do
    conn = get conn, "/"
    assert html_response(conn, 200) =~ "Your voice matters"
  end
end
