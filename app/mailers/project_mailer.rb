class ProjectMailer < ApplicationMailer
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.project_mailer.new_project_email.subject
  #
  def create_confirmation
    @project = params[:project]

    mail(
      to: @project.user.email,
      subject: "Project #{@project.name} was created!"
    )
  end

  def project_reminder
    @project = params[:project]

    mail(
      to: @project.user.email,
      subject: "Project Reminder!!!"
    )
  end
end
