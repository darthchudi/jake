class OpenWeather
  include HTTParty

  def get_city_weather(city)
    url = "#{ENV['WEATHER_API_URL']}?q=#{city}&appid=#{ENV['WEATHER_API_KEY']}"
    response = self.class.get(url).parsed_response 
  end 
end 

class GetWeather
  include Interactor

  def call
    # Todo: use a single instance
    openWeather = OpenWeather.new()
    
    response = openWeather.get_city_weather context['city']

    result = {
      lat: response['coord']['lat'],
      lng: response['coord']['lon'], 
      sunset: response['sys']['sunset'],
      sunrise: response['sys']['sunrise']
    } 

    context.weather = result 
  end
end
