class CreateLikes < ActiveRecord::Migration[5.2]
  def change
    create_table :likes do |t|
      t.references :dj, foreign_key: true
      t.references :playlist, foreign_key: true

      t.timestamps
    end
  end
end
