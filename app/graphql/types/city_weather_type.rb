module Types
  class CityWeatherType < Types::BaseObject
    field :lat, Integer, null: false
    field :lng, Integer, null: false
    field :sunset, GraphQL::Types::ISO8601DateTime, null: false
    field :sunrie, GraphQL::Types::ISO8601DateTime, null: false
  end
end
