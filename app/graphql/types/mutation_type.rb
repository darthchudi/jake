module Types
  class MutationType < Types::BaseObject
    field :signup, mutation: Mutations::SignupUser, description: "Creates a new user account"
    # field :login, mutation: Mutations::LoginUser, description: "Logs in a user and returns a token"
    # field :subscribe_weather_update, mutation: Mutations::SubscribeWeatherUpdate, description: "Subscribes a user to the daily weather update"
    # field :unsubscribe_weather_update, mutation: Mutations::UnsubscribeWeatherUpdate, description: "Unsubscribes a user from the daily weather update"
  end
end
