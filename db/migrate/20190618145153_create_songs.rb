class CreateSongs < ActiveRecord::Migration[5.2]
  def change
    create_table :songs do |t|
      t.string :title
      t.string :artist
      t.string :genre
      t.float :bpm

      t.timestamps
    end
  end
end
