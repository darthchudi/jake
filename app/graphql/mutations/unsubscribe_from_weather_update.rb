module Mutations 
    class UnsubscribeFromWeatherUpdate < Mutations::Base 
        field :user, Types::UserType, null: false 
        
        def resolve 
            ensure_authorized!
            result = ::UnsubscribeUser.call!(email: current_user.email)
            {user: result.user}
        end
    end 
end 