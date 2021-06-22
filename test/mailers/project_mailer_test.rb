require 'test_helper'

class ProjectMailerTest < ActionMailer::TestCase
  test "new_project_email" do
    mail = ProjectMailer.new_project_email
    assert_equal "New project email", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
