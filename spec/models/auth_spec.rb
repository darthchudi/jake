require "rails_helper"

RSpec.describe Auth do
    let (:email) {Faker::Internet.email}
    let (:password) {Faker::Internet.password(min_length: 10)}
    let (:city) {Faker::Hipster.word}

    subject do 
        User.create!(email: email, password: password, city: city) 
    end 

    it "successfully generates a token" do 
        expect(described_class.create_token subject).to be_truthy
    end 

    context "when a valid token is provided" do 
      it "successfully verifies the token" do 
        token = described_class.create_token subject 
        payload = described_class.verify_token token
        expect(payload["user_id"]).to eq subject.id
      end 
    end 

    context "when an invalid token is provided" do 
        it "fails to verify the token" do 
            randomToken = Faker::Internet.password(min_length: 30)
            expect{described_class.verify_token randomToken}.to raise_error(JWT::DecodeError)
        end 
    end 
end