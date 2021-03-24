module Helpers
    module Authorize
        def ensure_authorized!
            raise GraphQL::ExecutionError.new("Permission denied") if context[:current_user].blank?
        end 
    end 
end 

