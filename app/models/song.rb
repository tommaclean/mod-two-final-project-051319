class Song < ApplicationRecord
  has_many :playlist_songs, dependent: :destroy
  has_many :playlists, through: :playlist_songs

end


# t.string :title
# t.string :artist
# t.string :genre
# t.float :bpm
# t.timestamps
