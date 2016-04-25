defmodule PeepProjectBackend.SongTest do
  use PeepProjectBackend.ModelCase

  alias PeepProjectBackend.Song

  @valid_attrs %{album: "some content", art: "some content", artist: "some content", plays: 42, songurl: "some content", title: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Song.changeset(%Song{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Song.changeset(%Song{}, @invalid_attrs)
    refute changeset.valid?
  end
end
