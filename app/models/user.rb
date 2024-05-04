class User < ApplicationRecord
    # Include default devise modules. Others available are:
    #  :lockable, :timeoutable and :omniauthable
    devise :confirmable, :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable


    validates :name, presence: true
    validates :email, presence: true, uniqueness: { case_sensitive: false} 
    # see this helpful article = https://www.leighhalliday.com/requiring-uniqueness-in-rails#:~:text=Rails%20has%20a%20handy%20validator,field%20has%20a%20unique%20value.
    # And this too: https://stackoverflow.com/questions/1449459/how-do-i-make-a-column-unique-and-index-it-in-a-ruby-on-rails-migration
    
    #The two lines below establishing the relationship are necessary to create new users, cooperators and requester from Admin. 
    #rails documentation/ association / 2.11 Self Joins
    has_many :cooperators, class_name: "User" , foreign_key: "admin_id"
    belongs_to :admin, class_name: "User", optional: true 

end

  