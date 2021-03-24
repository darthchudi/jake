module Types
  class QueryType < Types::BaseObject
    # Add `node(id: ID!) and `nodes(ids: [ID!]!)`
    include GraphQL::Types::Relay::HasNodeField
    include GraphQL::Types::Relay::HasNodesField

    field :get_weather, resolver: Queries::GetWeather, description: "Gets the weather in a city (doesn't require auth)"
    field :get_user_weather, resolver: Queries::GetUserWeather, description: "Gets the weather in an existing user's city (requires auth)"
  end
end
