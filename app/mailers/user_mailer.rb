class UserMailer < ApplicationMailer
    default from: "updates@jake.eth"

    def daily_weather_update_email
        @user = params[:user]
        @weather = params[:weather]
        mail(to: @user.email, subject: "Daily Weather Update")
    end 
end
