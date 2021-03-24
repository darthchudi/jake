module Queries 
    class GetWeather < Queries::Base
        type Types::CityWeatherType, null: false 

        def resolve()
            ensure_authorized! 
            result = ::GetWeather.call(city: context[:current_user].city).weather
        end 
    end 
end 
