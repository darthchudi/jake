module Queries 
    class GetWeather < Queries::Base
        argument :city, String, required: true 

        type Types::CityWeatherType, null: false 

        def resolve(city:)
            ensure_authorized! 
            result = ::GetWeather.call(city: context[:current_user].city).weather
        end 
    end 
end 
