class RemoveColumns < ActiveRecord::Migration[5.0]
  def change
    remove_column :users, :email, :string
    rename_column :users, :name, :username
  end
end
