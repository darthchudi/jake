module Helpers
    module Authorize
        def ensure_authorized!
            raise GraphQL::ExecutionError.new("Permission denied") if current_user.blank?
        end 

        def current_user 
            context[:current_user]
        end 
    end 
end 

