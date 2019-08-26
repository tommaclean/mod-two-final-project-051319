# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Dj.destroy_all
# Playlist.destroy_all
# PlaylistSong.destroy_all
# Like.destroy_all
# Song.destroy_all

questlove = Dj.create(name: "Ahmir Thompson", username: "?uestlove", password: "123")
ronson = Dj.create(name: "Mark Ronson", username: "RonsonestMark", password: "123")
diplo = Dj.create(name: "Diplo", username: "Diplohhh", password: "123")

tess = Dj.create(name: "Tess", username: "lochness", password: "123")

friday = Playlist.create(name: "Friday Night Jams", description: "Some jams for Friday night", dj_id: questlove.id)
mellomoodz = Playlist.create(name: "Mello Moodz", description: "Feelin mello. These are the songs that fit that mood.", dj_id: ronson.id)
sadvibez = Playlist.create(name: "Sad Vibez", description: "WAHHH", dj_id: diplo.id)

tess_playlist = Playlist.create(name: "I wish I was a little bit taller", description: "did i stutter", dj_id: tess.id)

Like.create(dj_id: tess.id, playlist_id: friday.id)

Like.create(dj_id: questlove.id, playlist_id: mellomoodz.id)
Like.create(dj_id: questlove.id, playlist_id: sadvibez.id)

drake_song = Song.create(title: "Money in the Grave", artist: "Drake")
taylor_song = Song.create(title: "You Need to Calm Down", artist: "Taylor Swift")
billie_song = Song.create(title: "bad guy ", artist: "billie ellish")
lizzo_song = Song.create(title: "Truth Hurts", artist: "Lizzo")
lil_nas_song = Song.create(title: "Old Town Road (Remix)", artist: "Lil' Nas X (feat. Billy Ray Cyrus)")

PlaylistSong.create([
  {playlist_id: friday.id, song_id: drake_song.id},
  {playlist_id: friday.id, song_id: taylor_song.id},
  {playlist_id: tess_playlist.id, song_id: lizzo_song.id}
])
