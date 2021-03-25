require 'rails_helper'

module Queries 
    RSpec.describe GraphqlController, type: :controller do 
        context "when a city is provided" do 
            it "returns the weather" do 
                post :execute, :params => {query: query}
                result = JSON.parse(response.body)

                expect(result["data"]["getWeather"]["lat"]).to be_truthy
                expect(result["data"]["getWeather"]["lng"]).to be_truthy
                expect(result["data"]["getWeather"]["sunrise"]).to be_truthy
                expect(result["data"]["getWeather"]["sunset"]).to be_truthy
            end 
        end 

        def query 
            <<~GQL
            query {
                getWeather(city: "london") {
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