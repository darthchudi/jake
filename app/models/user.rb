class User < ApplicationRecord
    validates :email, :password, :city, presence: true 
end
