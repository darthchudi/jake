module Types
    module Input
        class SignupInputType < Types::BaseInputObject
            graphql_name "SignUpPayload"
            argument :email, String, required: true 
            argument :password, String, required: true 
            argument :city, String, required: true
        end
    end 
end 
