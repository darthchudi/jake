module Queries 
    class GetWeather < Queries::Base
        argument :city, String, required: true 

        type Types::CityWeatherType, null: false 

        def resolve(city:)
            result = ::GetWeather.call(city: city).weather
        end 
    end 
end 
