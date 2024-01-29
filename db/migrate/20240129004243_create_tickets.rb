class CreateTickets < ActiveRecord::Migration[7.1]
  def change
    create_table :tickets do |t|
      t.string :priority
      t.date :execution_date
      t.time :execution_time
      t.string :execution_place
      t.string :registered_by
      t.string :ticket_purpose
      t.string :service_type
      t.text :observation
      t.string :service_progress
      t.string :ticket_situation
      t.integer :service_evaluation
      t.text :suggestions_complaints

      t.timestamps
    end
  end
end
