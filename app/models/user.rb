class User < ApplicationRecord
    has_secure_password
    validates_uniqueness_of :email  
    validates :email, :city, presence: true
    validates :password, presence: true, on: :create
    
end
