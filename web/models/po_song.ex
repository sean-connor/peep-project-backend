defmodule PeepProjectBackend.PoSong do
  use PeepProjectBackend.Web, :model

  schema "songs" do
    field :title, :string
    field :artist, :string
    field :album, :string
    field :songurl, :string
    field :art, :string
    field :plays, :integer

    timestamps
  end

  @required_fields ~w(title artist album songurl art plays)
  @optional_fields ~w()

  @doc """
  Creates a changeset based on the `model` and `params`.

  If no params are provided, an invalid changeset is returned
  with no validation performed.
  """
  def changeset(model, params \\ :empty) do
    model
    |> cast(params, @required_fields, @optional_fields)
  end
end
