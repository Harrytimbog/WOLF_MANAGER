class User < ApplicationRecord
  after_create :send_welcome_email, :send_projects_reminder_

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :projects

  private

  def send_welcome_email
    UserMailer.with(user: self).welcome.deliver_now
  end

  def send_projects_reminder_
    UserMailer.with(user: self).projects_reminder.deliver_now
  end
end
