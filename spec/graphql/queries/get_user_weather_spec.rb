require 'rails_helper'

module Queries 
    RSpec.describe GraphqlController, type: :controller do 
        let (:email) {Faker::Internet.email}
        let (:password) {Faker::Internet.password(min_length: 10)}
        let (:city) {"barcelona"}

        let!(:data) do 
            ::SignupUser.call!(email: email, password: password, city: city)
        end 

        context "when an auth token is sent in the request" do 
            it "gets the weather in the user's city" do 
                request.headers["Authorization"] = "Bearer #{data.token}"
                post :execute, :params => {query: query} 

                result = JSON.parse(response.body)
                expect(result["data"]["getUserWeather"]["lat"]).to be_truthy
                expect(result["data"]["getUserWeather"]["lng"]).to be_truthy
                expect(result["data"]["getUserWeather"]["sunrise"]).to be_truthy
                expect(result["data"]["getUserWeather"]["sunset"]).to be_truthy
            end 
        end 

        context "when an auth token is not sent in the request" do 
            it "returns an authorization error" do
                post :execute, :params => {query: query} 

                result = JSON.parse(response.body)

                expect(result["data"]).to be nil 
                expect(result["errors"][0]["message"]).to eq "Permission denied"
            end
        end 

        def query 
            <<~GQL
            query {
                getUserWeather {
                    lat
                    lng 
                    sunrise 
                    sunset
                }
            }
            GQL
        end 

    end 
end 