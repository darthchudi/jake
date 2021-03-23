module Mutations 
    class SignupUser < Mutations::Base
        argument :email, String, required: true 
        argument :password, String, required: true 
        argument :city, String, required: true 

        field :user, Types::UserType, null: false 
        field :token, String, null: false

        def resolve(email:, password:, city:)
            result = ::SignupUser.call(email: email, password: password, city: city)
            {user: result.user, token: result.token}
        end
    end 
end 

            