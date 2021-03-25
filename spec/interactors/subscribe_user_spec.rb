require 'rails_helper'

RSpec.describe SubscribeUser, type: :interactor do
  let (:email) {Faker::Internet.email}
  let (:password) {Faker::Internet.password(min_length: 10)}
  let (:city) {Faker::Hipster.word}

  subject(:context) do
    User.create!(email: email, password: password, city: city) 
    described_class.call(email: email)
  end

  context "when it is given a user's email" do
    it "subscribes the user to weather updates" do
      expect(context.user.is_subscribed).to be true 
    end
  end
end
