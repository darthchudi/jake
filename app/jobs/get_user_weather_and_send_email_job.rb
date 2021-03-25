class GetUserWeatherAndSendEmailJob < ApplicationJob
  def perform(user)
    weather = ::GetWeather.call!(city: user.city).weather 
    UserMailer.with(user: user, weather: weather).daily_weather_update_email.deliver_now
  end
end
