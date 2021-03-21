module Types
  class MutationType < Types::BaseObject
    field :signup, mutation: Mutations::Signup, description: "Creates a new user account"
  end
end
