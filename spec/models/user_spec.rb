require "rails_helper"

RSpec.describe User, type: :model do
  
  @user = User.create!(email: 'abdou@example.com',name: 'abdou',send_due_date_reminder: true, send_due_reminder_interval: 0,due_date_reminder_time: Time.now ,time_zone: 'Egypt');

  context "#validations" do
    it { is_expected.to validate_presence_of(:email) }
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:send_due_date_reminder) }
    it { is_expected.to validate_presence_of(:send_due_reminder_interval) }
    it { is_expected.to validate_presence_of(:due_date_reminder_time) }
    it { is_expected.to validate_presence_of(:time_zone) }
  end

end
