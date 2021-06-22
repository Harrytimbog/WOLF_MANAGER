class ProjectMailer < ApplicationMailer
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.project_mailer.new_project_email.subject
  #
  def new_project_email
    @project = params[:project]

    mail(to: @project.user.email, subject: "You created a new project <%= @project.name %>!")
  end
end
