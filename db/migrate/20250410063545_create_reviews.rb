class CreateReviews < ActiveRecord::Migration[6.1]
  def change
    create_table :reviews do |t|
      t.integer :user_id, null: false
      t.integer :game_id, null: false
      t.string  :title, null: false
      t.text    :body, null: false
      t.float   :star, null: false
      t.timestamps
    end
    add_index :reviews, :user_id
    add_index :reviews, :game_id
  end
end
