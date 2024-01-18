class CreateUsers < ActiveRecord::Migration[7.1]
  def change
    create_table :users do |t|
      t.string :name, null: false
      t.string :coordination
      t.string :telephone
      t.string :email, null: false
      t.string :company
      t.boolean :cooperator 

      t.timestamps
    end
  end
end
