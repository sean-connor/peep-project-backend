defmodule PeepProjectBackend.Repo.Migrations.CreateSong do
  use Ecto.Migration

  def change do
    create table(:songs) do
      add :title, :string
      add :artist, :string
      add :album, :string
      add :songurl, :string
      add :art, :string
      add :plays, :integer

      timestamps
    end

  end
end
