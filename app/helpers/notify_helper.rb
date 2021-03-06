module NotifyHelper
    
    def self.send_ticket(ticket)
        NotifyHelper::Notification.new().send(ticket)
    end    

    class Notification
        RegisterServices = ["EmailNotification"]
        def send(ticket)
            RegisterServices.each do |service|
                Object.const_get(service).send(ticket);
            end
        end     
    end


end
  