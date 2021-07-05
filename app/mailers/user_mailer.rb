class UserMailer < ApplicationMailer
  def welcome
    @user = params[:user] # Instance variable => available in view
    mail(to: @user.email, subject: 'Welcome to Wolf Projects')
    # This will render a view in `app/views/user_mailer`!
  end

  def projects_reminder
    @user = params[:user]
    mail(
      to: @user.email,
      subject: "Projects Reminder!!!"
    )
  end
end
