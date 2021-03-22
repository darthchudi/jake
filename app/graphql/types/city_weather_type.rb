module Types
  class CityWeatherType < Types::BaseObject
    field :lat, Float, null: false
    field :lng, Float, null: false
    field :sunset, Integer, null: false
    field :sunrise, Integer, null: false
  end
end
