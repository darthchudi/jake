class User < ApplicationRecord
    has_secure_password
    validates :email, :password, :city, presence: true 
end
