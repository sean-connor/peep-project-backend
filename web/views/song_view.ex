defmodule PeepProjectBackend.SongView do
  use PeepProjectBackend.Web, :view

  def render("index.json", %{songs: songs}) do
    %{songs: render_many(songs, PeepProjectBackend.SongView, "song.json")}
  end

  def render("show.json", %{song: song}) do
    %{song: render_one(song, PeepProjectBackend.SongView, "song.json")}
  end

  def render("song.json", %{song: song}) do
    %{id: song.id,
      title: song.title,
      artist: song.artist,
      album: song.album,
      songurl: song.songurl,
      art: song.art,
      plays: song.plays}
  end
end
