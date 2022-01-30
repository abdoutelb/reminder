require "rails_helper"

describe EmailNotification do
  describe "#RegisterServices" do
    it "register service" do
        @user = User.create!(email: 'abdou@example.com',name: 'abdou',send_due_date_reminder: true, send_due_reminder_interval: 0,due_date_reminder_time: Time.now ,time_zone: 'Egypt');

        @ticket = Ticket.create!(title: 'task',description: 'development task',user_id: @user.id)

      #helper::send_ticket(@ticket).should eql("This ticket task went to abdou@example.com")
      EmailNotification.send(@ticket).should eql("This ticket task went to abdou@example.com")
    end
  end 
end