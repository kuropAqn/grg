class CreateGameTags < ActiveRecord::Migration[6.1]
  def change
    create_table :gametags do |t|
      t.references :game, null: false, foreign_key: true
      t.references :tag, null: false, foreign_key: true

      t.timestamps
    end
  end
end
