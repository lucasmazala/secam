class Cooperator < User
    has_and_belongs_to_many :tickets, join_table: "cooperators_tickets" #join_table option needs the be into the two classes 
end
