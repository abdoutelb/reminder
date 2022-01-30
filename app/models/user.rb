class User < ApplicationRecord
    
    validates_presence_of :name, :email, :send_due_date_reminder ,:send_due_reminder_interval, :due_date_reminder_time, :time_zone

    def activate
        self.update(send_due_date_reminder: true)
    end
    
    def deactivate
        self.update(send_due_date_reminder: false)
    end

    def set_interval(time)
        self.update(send_due_reminder_interval: time)
    end

    def set_recived_due_date(time)
        self.update(due_date_reminder_time: time)
    end
    
    def set_time_zone(time)
        self.update(time_zone: time)
    end

end