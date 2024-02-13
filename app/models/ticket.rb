class Ticket < ApplicationRecord
    belongs_to :requester, class_name: "User"
    has_and_belongs_to_many :cooperators, join_table: "cooperators_tickets" #join_table option is important to rails find the relationship between the subclass
end
