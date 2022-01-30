module NotifyHelper
class Notifier
    def self.send_ticket(ticket)
        puts "You passed here"
        NotifyHelper::Notification.new("email",Time.now).send(ticket)
    end
    # private
    # def delivered?(status)
    #     status == 0 ? true : false
    # end    
end

class Notification
    attr_accessor :email, :delivered,:due_date
    RegisterServices = ["EmailNotification"]
    def initialize(email, due_date)
        @email = email
        @due_date = due_date
        @delivered = false
      end
    def send(ticket)
        RegisterServices.each do |service|
            Object.const_get(service).send(ticket);
        end
    end      
end

end
  