class RemoveCooperatorFromUsers < ActiveRecord::Migration[7.1]
  def change
    remove_column :users, :cooperator, :boolean
  end
end
