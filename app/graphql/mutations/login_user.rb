module Mutations 
    class LoginUser < Mutations::Base 
        argument :email, String, required: true 
        argument :password, String, required: true 

        field :user, Types::UserType, null: false 
        field :token, String, null: false

        def resolve(email:, password:)
            result = ::LoginUser.call!(email: email, password: password)
            {user: result.user, token: result.token}
        end 
    end 
end 


