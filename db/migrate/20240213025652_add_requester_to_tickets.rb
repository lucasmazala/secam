class AddRequesterToTickets < ActiveRecord::Migration[7.1]
  # This is necessary to stablish a relationship between requester and ticket. 
  # Because we are using STI, is passed in the foreign key the Users class instead of Requesters. Requester doesn't exists in our DB. 
  #This code was add manually. 
  def change
    add_column :tickets, :requester_id, :integer
    add_foreign_key :tickets, :users, column: :requester_id, null: false
  end
end
