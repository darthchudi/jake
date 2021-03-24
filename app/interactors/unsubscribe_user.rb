class UnsubscribeUser 
    include Interactor 

    def call 
        user = User.find_by!(email: context.email)
        user.update!(is_subscribed: false)
        context.user = user
    end 
end 