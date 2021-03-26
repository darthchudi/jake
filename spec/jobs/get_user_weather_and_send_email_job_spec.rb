require 'rails_helper'

RSpec.describe GetUserWeatherAndSendEmailJob, type: :job do
  let (:email) {Faker::Internet.email}
  let (:password) {Faker::Internet.password(min_length: 10)}
  let (:city) {Faker::Hipster.word}

  let!(:user) do 
    User.create!(email: email, password: password, city: city) 
  end 

  subject do 
    described_class.new.perform(user) 
  end 

  before do 
    allow(GetWeather).to receive(:call!).with(city: city).and_return(
      OpenStruct.new({
        weather: {
          lat: 6000,
          lng: -100.22,
          sunset: 4599,
          sunrise: 11000
        }
      })
    )
  end 

  context "when the job is performed" do 
    it "should get the weather in the user's city and send an email" do 
      expect(GetWeather).to receive(:call!).with(city: city).exactly(:once)
      subject
    end 
  end 
end
