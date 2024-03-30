class AddIndexToUsers < ActiveRecord::Migration[7.1]
  def change
    #add_column :users, :email, :string # this column already exists.
    add_index :users, :email, unique: true
  end
end
