module Queries 
    class Base < GraphQL::Schema::Resolver 
        include Helpers::Authorize
    end 
end 