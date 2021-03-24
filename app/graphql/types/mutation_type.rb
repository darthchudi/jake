module Types
  class MutationType < Types::BaseObject
    field :signup, mutation: Mutations::SignupUser
    field :login, mutation: Mutations::LoginUser
    field :subscribe, mutation: Mutations::SubscribeUser, description: "Subscribes a user to daily weather updates"
    # field :unsubscribe_weather_update, mutation: Mutations::UnsubscribeWeatherUpdate, description: "Unsubscribes a user from the daily weather update"
  end
end
