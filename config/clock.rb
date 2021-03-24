require 'clockwork'
require './config/boot'
require './config/environment'
require 'active_support/time'

module Clockwork
  handler do |job|
    puts "Sending daily weather updates"
    SendDailyWeatherUpdateEmailsJob.perform_later
  end


  every(2.seconds, 'frequent.job')
#   every(3.minutes, 'less.frequent.job')
#   every(1.hour, 'hourly.job')

#   every(1.day, 'midnight.job', :at => '00:00')
end