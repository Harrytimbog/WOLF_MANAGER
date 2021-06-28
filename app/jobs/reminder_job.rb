class ReminderJob < ApplicationJob
  queue_as :default

  def perform
    mail = UserMailer.with(user: @user).project_reminder
    mail.deliver_now
  end
end
