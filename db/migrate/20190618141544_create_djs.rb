class CreateDjs < ActiveRecord::Migration[5.2]
  def change
    create_table :djs do |t|
      t.string :name
      t.string :username
      t.string :password_digest
      t.text :bio


      t.timestamps
    end
  end
end
