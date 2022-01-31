require "rails_helper"

describe EmailNotification do
  describe "#sending email" do
    it "check output for sending ticket" do
      EmailNotification.send(Ticket.first).should eql("This ticket task went to abdou@example.com")
    end
  end 
end