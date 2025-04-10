class CreateGames < ActiveRecord::Migration[6.1]
  def change
    create_table :games do |t|
      t.integer :genre_id, null: false
      t.string  :title, null: false
      t.text    :body, null: false
      t.integer :price, null: false

      t.timestamps
    end
  end
end
