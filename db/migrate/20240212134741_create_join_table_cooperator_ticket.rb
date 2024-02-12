class CreateJoinTableCooperatorTicket < ActiveRecord::Migration[7.1]
  def change
    create_join_table :cooperators, :tickets do |t|
       t.index [:cooperator_id, :ticket_id]
       t.index [:ticket_id, :cooperator_id]
    end
  end
end
