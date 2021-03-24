class LoginUser
    include Interactor 

    def call 
        begin 
            user = User.find_by!(email: context.email)
            raise GraphQL::ExecutionError.new "Invalid login credentials" unless user.authenticate(context.password)
        rescue ActiveRecord::RecordNotFound
            raise GraphQL::ExecutionError.new "Invalid login credentials"
        end 

        token = Auth.create_token user 

        context.user = user 
        context.token = token 
    end 
end 