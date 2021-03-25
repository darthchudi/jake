require 'rails_helper'

module Mutations
    RSpec.describe GraphqlController, type: :controller do
        let (:email) {Faker::Internet.email}
        let (:password) {Faker::Internet.password(min_length: 10)}
        let (:city) {Faker::Hipster.word}

        let!(:user) do 
            User.create!(email: email, password: password, city: city) 
        end 

        context "when a valid password is provided" do 
            it "login successfully" do 
                post :execute, params: {query: query}
                result = JSON.parse(response.body)

                expect(result["data"]["login"]["user"]["email"]).to eq user.email 
                expect(result["data"]["login"]["token"]).to be_truthy 
            end 
        end 

        context "when an invalid password is provided" do 
            it "return an invalid credentials error" do 
                post :execute, params: {query: query_with_invalid_password}
                result = JSON.parse(response.body)
                expect(result["data"]["login"]).to eq nil 
                expect(result["errors"][0]["message"]).to eq "Invalid login credentials"
            end 
        end 

        def query 
            <<~GQL
                mutation {
                    login(input: {
                        email: "#{email}",
                        password: "#{password}",
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

        def query_with_invalid_password 
            <<~GQL
                mutation {
                    login(input: {
                        email: "#{email}",
                        password: "#{Faker::Internet.password(min_length: 10)}",
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
