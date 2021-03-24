class OpenWeather
  include HTTParty

  def self.get_weather_for_city(city)
    url = "#{ENV['WEATHER_API_URL']}?q=#{city}&appid=#{ENV['WEATHER_API_KEY']}"
    response = self.get(url).parsed_response 
  end 
end 

class GetWeather
  include Interactor

  def call
    response = OpenWeather.get_weather_for_city context['city']

    result = {
      lat: response['coord']['lat'],
      lng: response['coord']['lon'], 
      sunset: response['sys']['sunset'],
      sunrise: response['sys']['sunrise']
    } 

    context.weather = result 
  end
end
