module Types
  class MutationType < Types::BaseObject
    field :signup, mutation: Mutations::SignupUser, description: "Creates a new user account"
  end
end
