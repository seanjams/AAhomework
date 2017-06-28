class CreateArtWorks < ActiveRecord::Migration[5.0]
  def change
    create_table :art_works do |t|
      t.string :title, null: false
      t.string :image_url, null: false
      t.integer :artist_id, null: false
    end
  add_index :art_works, :artist_id
  end
end
