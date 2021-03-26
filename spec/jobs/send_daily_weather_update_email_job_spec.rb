require 'rails_helper'

RSpec.describe SendDailyWeatherUpdateEmailsJob, type: :job do
  subject do 
    described_class.new.perform 
  end 

  let(:subscribed_user) do 
    # create 1 unsubscribed user 
    User.create!(email: Faker::Internet.email, password: Faker::Internet.password(min_length: 10), city: Faker::Hipster.word, is_subscribed: false) 

     # create 1 subscribed user
     User.create!(email: Faker::Internet.email, password: Faker::Internet.password(min_length: 10), city: Faker::Hipster.word, is_subscribed: true) 
  end  

  context "when the job is performed" do 
    it "should send weather updates to only subscribed users" do 
      expect(GetUserWeatherAndSendEmailJob).to receive(:perform_later).exactly(:once).with(subscribed_user)
      subject
    end 
  end 

end
