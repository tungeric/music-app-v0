class CreateTracks < ActiveRecord::Migration[5.1]
  def change
    create_table :tracks do |t|
      t.string :name, null: false
      t.integer :album_id, null: false
      t.integer :ord, null: false
      t.boolean :bonus, null: false, default: false
      t.text :lyrics
      t.timestamps
    end
    add_index :tracks, :album_id
    add_index :tracks, [:name, :album_id], unique: true
  end
end
