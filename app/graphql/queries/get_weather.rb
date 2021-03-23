module Queries 
    class GetWeather < Queries::BaseQuery
        argument :city, String, required: true 

        type Types::CityWeatherType, null: false 

        def resolve(city:)
            raise GraphQL::ExecutionError.new("Authentication required") if context[:current_user].blank?
            result = ::GetWeather.call(city: context[:current_user].city).weather
        end 
    end 
end 
