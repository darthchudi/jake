module Helpers
    class Authorize
        def ensure_authorized!
            raise GraphQL::ExecutionError.new("Authorization required") if context[:current_user].blank?
        end 
    end 
end 

