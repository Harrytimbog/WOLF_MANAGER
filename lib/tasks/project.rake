namespace :project do
  desc "Reminder for all Users who created a project"
  task remind_all: :environment do
    projects = Project.all
    puts "Enqueuing reminder for #{projects.size} projects..."
    projects.each do |project|
      ReminderJob.perform_later(project.id)
    end
  end
end
