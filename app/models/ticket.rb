class Ticket < ApplicationRecord
    NOT_DELIVED = 0
    DELIVED = 1
    validates_presence_of :title

    after_create do
      NotifyHelper::Notifier.send_ticket(self)
    end

    def sent
      self.update(status_id: Ticket::DELIVED)
    end

  end