class UserNotifierMailer < ApplicationMailer
    default :from => 'abdoutelb.fci@gmail.com'


  def send_ticket_email(ticket,email)
    @ticket = ticket
    mail( :to => email,
    :subject => 'Chear Up!! You have new ticket' )
  end
end
