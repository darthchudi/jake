class SendDailyWeatherUpdateEmailsJob < ApplicationJob
  def perform
    User.where(is_subscribed: true).find_each do |user|
      SendEmailJob.perform_later(user)
    end 
  end
end
