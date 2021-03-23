require 'rails_helper'

module Mutations 
    RSpec.describe GraphqlController, type: :controller do 
        let (:email) {Faker::Internet.email}
        let (:password) {Faker::Internet.password(min_length: 10)}
        let (:city) {"lagos"}

        it "should allow a user signup" do 
            post :execute, params: {query: query}

            result = JSON.parse(response.body)

            # Todo: Add assertions on result (user and token)
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
                        email
                        },
                        token
                    }
                }
            GQL
        end 
    end
end 