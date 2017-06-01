defmodule Gotv.Subscriber do
  use Gotv.Web, :model

  schema "subscribers" do
    field :first_name, :string
    field :last_name, :string
    field :email_address, :string

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:first_name, :last_name, :email_address])
    |> validate_required([:email_address])
    |> validate_format(:email_address, ~r/@[a-z\d\-.]+\.[a-z]+\z/i)
  end
end
