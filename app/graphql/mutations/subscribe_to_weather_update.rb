module Mutations 
    class SubscribeToWeatherUpdate < Mutations::Base 
        field :user, Types::UserType, null: false 
        
        def resolve 
            ensure_authorized!
            result = ::SubscribeUser.call(email: current_user.email)
            {user: result.user}
        end
    end 
end 