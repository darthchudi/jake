module Mutations 
    class Signup < Mutations::BaseMutation
        argument :params, Types::Input::SignupInputType, required: true 
        field :user, Types::UserType, null: false 


        def resolve(params:)
            {user: user}
        end
    end 
end 

            