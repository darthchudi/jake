module Queries 
    class BaseQuery < GraphQL::Schema::Resolver 
        include Helpers::Authorize
    end 
end 