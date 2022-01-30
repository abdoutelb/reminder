class Ticket < ApplicationRecord
    NOT_DELIVED = 0
    DELIVED = 1
    validates_presence_of :title
    belongs_to :user

    after_create do
      NotifyHelper::Notifier.send_ticket(self) if self.user.send_due_date_reminder?
    end

    def sent
      self.update(status_id: Ticket::DELIVED)
    end

  end