require 'rails_helper'

module Mutations 
    RSpec.describe GraphqlController, type: :controller do
        let (:email) {Faker::Internet.email}
        let (:password) {Faker::Internet.password(min_length: 10)}
        let (:city) {Faker::Hipster.word}

        let!(:data) do 
            ::SignupUser.call!(email: email, password: password, city: city)
        end 

        context "when an auth token is sent in the request" do 
            it "allow the user subscribe to weather updates" do 
                request.headers["Authorization"] = "Bearer #{data.token}"
                post :execute, :params => {query: query} 

                result = JSON.parse(response.body)
                # id is sent as a string by graphql
                expect(result["data"]["subscribeToWeatherUpdate"]["user"]["id"].to_i).to eq data.user.id 
                expect(result["data"]["subscribeToWeatherUpdate"]["user"]["isSubscribed"]).to be true  
            end 
        end 

        context "when an auth token is not sent in the request" do 
            it "returns an authorization error" do
                post :execute, :params => {query: query} 

                result = JSON.parse(response.body)

                expect(result["data"]["subscribeToWeatherUpdate"]).to be nil 
                expect(result["errors"][0]["message"]).to eq "Permission denied"
            end
        end 

        def query 
            <<~GQL
                mutation {
                    subscribeToWeatherUpdate(input: {}) {
                        user {
                        id
                        isSubscribed
                        }
                    }
                }
            GQL
        end 
    end
end 