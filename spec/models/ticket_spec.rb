require "rails_helper"

RSpec.describe Ticket, type: :model do
  
@user = User.create!(email: 'abdou@example.com',name: 'abdou',send_due_date_reminder: true, send_due_reminder_interval: 0,due_date_reminder_time: Time.now ,time_zone: 'Egypt');

 @ticket = Ticket.create!(title: 'task',description: 'development task',user_id: @user.id)

  context "#validations" do
    it { is_expected.to validate_presence_of(:title) }
  end

  context "#relations" do
    
  end

end

