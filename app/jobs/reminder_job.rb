class ReminderJob < ApplicationJob
  queue_as :default

  def perform(project_id)
    @project = Project.find(project_id)
    mail = ProjectMailer.with(project: @project).project_reminder
    mail.deliver_now
  end
end
