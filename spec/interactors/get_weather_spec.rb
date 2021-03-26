require 'rails_helper'

RSpec.describe GetWeather, type: :interactor do
  subject(:context) do 
    described_class.call!(city: city) 
  end 
  
  let (:city) {["madrid", "london", "lagos", "barcelona"].sample}

  context "when a weather query is made" do 
    it "returns the weather" do 
      expect(context).to be_a_success
      expect(context.weather[:lat]).to be_truthy
      expect(context.weather[:lng]).to be_truthy
      expect(context.weather[:sunrise]).to be_truthy
      expect(context.weather[:sunset]).to be_truthy
    end 
  end 
end
