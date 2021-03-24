module Types
  class MutationType < Types::BaseObject
    field :signup, mutation: Mutations::SignupUser
    field :login, mutation: Mutations::LoginUser
    field :subscribe, mutation: Mutations::SubscribeUser, description: "Subscribes a user to daily weather updates"
    field :unsubscribe, mutation: Mutations::UnsubscribeUser, description: "Unsubscribes a user from daily weather updates"
  end
end
