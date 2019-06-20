class Playlist < ApplicationRecord
  belongs_to :author, class_name: "Dj", foreign_key: :dj_id

  has_many :likes, dependent: :destroy
  has_many :djs, through: :likes

  has_many :playlist_songs
  has_many :songs, through: :playlist_songs

  validates :name, presence:true

end


# t.string :name
# t.string :category
# t.references :dj, foreign_key: true
# t.timestamps
