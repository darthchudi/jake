require 'spec_helper'

RSpec.describe SignupUser, type: :interactor do
  let (:email) {Faker::Internet.email}
  let (:password) {Faker::Internet.password(min_length: 10)}
  let (:city) {Faker::Hipster.word}

  subject(:context) do
    described_class.call(email: email, password: password, city: city)
  end

  context "when a valid email is provided" do
    it "should allow a user signup" do
      expect(context).to be_a_success
      expect(context.user.id).to be_truthy
      expect(context.token).to be_truthy
    end
  end

  context "when an existing email is provided" do
    let!(:user) do 
      User.create!(email: email, password: password, city: city) 
    end

    it "should return an error" do 
      expect(context).to be_a_failure
      puts "#{context.inspect}"
    end 
  end
end
