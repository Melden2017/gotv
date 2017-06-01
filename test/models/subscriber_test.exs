defmodule Gotv.SubscriberTest do
  use Gotv.ModelCase

  alias Gotv.Subscriber

  @valid_attrs %{email_address: "jimmy@zeppelin.com"}

  test "changeset with valid attributes" do
    changeset = Subscriber.changeset(%Subscriber{}, @valid_attrs)

    assert changeset.valid?
  end

  test "email address is required" do
    changeset = Subscriber.changeset(%Subscriber{}, %{email_address: ""})

    refute changeset.valid?
    assert changeset.errors[:email_address] ==
      {"can't be blank", [validation: :required]}
  end

  test "email address format must be valid" do
    changeset = Subscriber.changeset(%Subscriber{}, %{email_address: "jimmy@test"})

    refute changeset.valid?
    assert changeset.errors[:email_address] ==
      {"has invalid format", [validation: :format]}
  end
end
