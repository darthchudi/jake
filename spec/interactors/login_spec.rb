require 'spec_helper'

RSpec.describe LoginUser, type: :interactor do
  let (:email) {Faker::Internet.email}
  let (:password) {Faker::Internet.password(min_length: 10)}
  let (:city) {Faker::Hipster.word}

  subject(:context) do
    User.create!(email: email, password: password, city: city) 
    described_class.call(email: email, password: password)
  end

  context "when a valid password is provided" do
    it "login successfully" do
      expect(context).to be_a_success
      expect(context.user.id).to be_truthy
      expect(context.token).to be_truthy
    end
  end

  context "when an invalid password is provided" do
    it "should return an error" do 
      expect{described_class.call(email: email, password: Faker::Internet.password(min_length: 10))}.to raise_error("Invalid login credentials")
    end 
  end
end
