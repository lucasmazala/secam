class User < ApplicationRecord
    validates :name, presence: true
    validates :email, presence: true, uniqueness: { case_sensitive: false} 
    # see this helpful article = https://www.leighhalliday.com/requiring-uniqueness-in-rails#:~:text=Rails%20has%20a%20handy%20validator,field%20has%20a%20unique%20value.
    # And this too: https://stackoverflow.com/questions/1449459/how-do-i-make-a-column-unique-and-index-it-in-a-ruby-on-rails-migration
end

