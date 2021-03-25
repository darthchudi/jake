require 'rails_helper'

module Mutations 
    RSpec.describe GraphqlController, type: :controller do
        let (:email) {Faker::Internet.email}
        let (:password) {Faker::Internet.password(min_length: 10)}
        let (:city) {Faker::Hipster.word}

        # We need a subscribed user before we can unsubscribe
        let!(:data) do 
            result = ::SignupUser.call(email: email, password: password, city: city)
            subscribedUser = ::SubscribeUser.call(email: result.user.email).user 
            OpenStruct.new(token: result.token, user: subscribedUser)
        end 

        context "when an auth token is sent in the request" do 
            it "allow the user to unsubscribe from weather updates" do 
                request.headers["Authorization"] = "Bearer #{data.token}"
                post :execute, :params => {query: query} 

                result = JSON.parse(response.body)
                # id is sent as a string by graphql
                expect(result["data"]["unsubscribeFromWeatherUpdate"]["user"]["id"].to_i).to eq data.user.id 
                expect(result["data"]["unsubscribeFromWeatherUpdate"]["user"]["isSubscribed"]).to be false  
            end 
        end 

        context "when an auth token is not sent in the request" do 
            it "returns an authorization error" do
                post :execute, :params => {query: query} 

                result = JSON.parse(response.body)

                expect(result["data"]["unsubscribeFromWeatherUpdate"]).to be nil 
                expect(result["errors"][0]["message"]).to eq "Permission denied"
            end
        end 

        def query 
            <<~GQL
                mutation {
                    unsubscribeFromWeatherUpdate(input: {}) {
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