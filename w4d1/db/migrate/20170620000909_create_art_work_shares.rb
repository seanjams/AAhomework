class CreateArtWorkShares < ActiveRecord::Migration[5.0]
  def change
    create_table :art_work_shares do |t|
      t.integer :art_work_id, null: false
      t.integer :viewer_id, null: false

      t.timestamps
    end

  add_index :art_work_shares, [:art_work_id, :viewer_id]

  end
end
