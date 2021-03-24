module Types
  class UserType < Types::BaseObject
    field :id, ID, null: false
    field :email, String, null: false
    field :city, String, null: false
    field :is_subscribed, Boolean, null: false
  end
end
