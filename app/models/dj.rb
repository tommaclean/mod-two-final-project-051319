class Dj < ApplicationRecord
  has_many :playlists, dependent: :destroy

  has_many :likes
  has_many :liked_playlists, through: :likes, source: :playlist
  after_initialize :default_info
  has_secure_password

  validates :username, presence:true, uniqueness: true

  def default_info
    self.name ||= "Anon"
    self.bio ||= "default bio"
  end

end

# t.string :name
# t.string :username
# t.string :password_digest
# t.string :bio
