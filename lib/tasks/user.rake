namespace :user do
  desc "Remind users about projects"
  task remind_all: :environment do
    users = User.all
    puts "Reminding all #{users.size} users..."
    ReminderJob.set(wait_until: Date.tomorrow.noon).perform_later
    # rake task will return when all jobs are _enqueued_ (not done).
  end
end
