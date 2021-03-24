module Types
  class MutationType < Types::BaseObject
    field :signup, mutation: Mutations::SignupUser
    field :login, mutation: Mutations::LoginUser
    field :subscribe_to_weather_update, mutation: Mutations::SubscribeToWeatherUpdate
    field :unsubscribe_from_weather_update, mutation: Mutations::UnsubscribeFromWeatherUpdate
  end
end
