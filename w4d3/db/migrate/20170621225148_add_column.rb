class AddColumn < ActiveRecord::Migration
  def change
    add_column :cats, :user_id, :integer, null: false, unique: true
    add_index :cats, :user_id
  end
end
