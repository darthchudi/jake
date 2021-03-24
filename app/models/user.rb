class User < ApplicationRecord
    has_secure_password
    validates :password, presence: true, on: :create
    validates :email, :city, presence: true
end
