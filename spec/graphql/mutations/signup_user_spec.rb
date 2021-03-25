require 'rails_helper'

module Mutations 
    RSpec.describe GraphqlController, type: :controller do 
        let (:email) {Faker::Internet.email}
        let (:password) {Faker::Internet.password(min_length: 10)}
        let (:city) {Faker::Hipster.word}

        context "when a valid email is provided" do
            it "should allow a user signup" do 
                post :execute, params: {query: query}
                result = JSON.parse(response.body)

                expect(result["data"]["signup"]["user"]["id"]).to be_truthy 
                expect(result["data"]["signup"]["token"]).to be_truthy 
            end
        end 

        context "when an existing email is provided" do
            let!(:user) do 
                User.create!(email: email, password: password, city: city) 
            end 

            it "should return an error" do 
                post :execute, params: {query: query}
                result = JSON.parse(response.body)

                expect(result["data"]["signup"]).to eq nil
                expect(result["errors"][0]["message"]).to eq "Validation failed: Email has already been taken"
            end 
        end 

        def query
            <<~GQL
                mutation {
                    signup(input: {
                        email: "#{email}",
                        password: "#{password}",
                        city: "#{city}"
                    }) {
                        user {
                        id,
                        email
                        },
                        token
                    }
                }
            GQL
        end 
    end
end 