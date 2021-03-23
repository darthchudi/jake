class SendEmailJob < ApplicationJob
  def perform(user)
    # Invoke Mailer with user info
  end
end
