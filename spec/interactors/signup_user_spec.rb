require 'rails_helper'

RSpec.describe SignupUser, type: :interactor do
  let (:email) {Faker::Internet.email}
  let (:password) {Faker::Internet.password(min_length: 10)}
  let (:city) {Faker::Hipster.word}

  subject(:context) do
    described_class.call!(email: email, password: password, city: city)
  end

  context "when a valid email is provided" do
    it "should allow a user signup" do
      expect(context).to be_a_success
      expect(context.user.id).to be_truthy
      expect(context.token).to be_truthy
    end
  end

  context "when an existing email is provided" do
    it "should return an error" do 
      expect{described_class.call!(email: context.user.email, password: context.user.password, city: context.user.city)}.to raise_error("Validation failed: Email has already been taken")
    end 
  end
end
