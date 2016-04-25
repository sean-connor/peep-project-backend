defmodule PeepProjectBackend.SongControllerTest do
  use PeepProjectBackend.ConnCase

  alias PeepProjectBackend.Song
  @valid_attrs %{album: "some content", art: "some content", artist: "some content", plays: 42, songurl: "some content", title: "some content"}
  @invalid_attrs %{}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, song_path(conn, :index)
    assert json_response(conn, 200)["data"] == []
  end

  test "shows chosen resource", %{conn: conn} do
    song = Repo.insert! %Song{}
    conn = get conn, song_path(conn, :show, song)
    assert json_response(conn, 200)["data"] == %{"id" => song.id,
      "title" => song.title,
      "artist" => song.artist,
      "album" => song.album,
      "songurl" => song.songurl,
      "art" => song.art,
      "plays" => song.plays}
  end

  test "does not show resource and instead throw error when id is nonexistent", %{conn: conn} do
    assert_error_sent 404, fn ->
      get conn, song_path(conn, :show, -1)
    end
  end

  test "creates and renders resource when data is valid", %{conn: conn} do
    conn = post conn, song_path(conn, :create), song: @valid_attrs
    assert json_response(conn, 201)["data"]["id"]
    assert Repo.get_by(Song, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, song_path(conn, :create), song: @invalid_attrs
    assert json_response(conn, 422)["errors"] != %{}
  end

  test "updates and renders chosen resource when data is valid", %{conn: conn} do
    song = Repo.insert! %Song{}
    conn = put conn, song_path(conn, :update, song), song: @valid_attrs
    assert json_response(conn, 200)["data"]["id"]
    assert Repo.get_by(Song, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    song = Repo.insert! %Song{}
    conn = put conn, song_path(conn, :update, song), song: @invalid_attrs
    assert json_response(conn, 422)["errors"] != %{}
  end

  test "deletes chosen resource", %{conn: conn} do
    song = Repo.insert! %Song{}
    conn = delete conn, song_path(conn, :delete, song)
    assert response(conn, 204)
    refute Repo.get(Song, song.id)
  end
end
