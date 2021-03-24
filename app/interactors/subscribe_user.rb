class SubscribeUser 
    include Interactor 

    def call 
        user = User.find_by!(email: context.email)
        user.update!(is_subscribed: true)
        context.user = user
    end 
end 