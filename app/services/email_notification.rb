require 'sendgrid-ruby'
class EmailNotification 
    include SendGrid

    def self.send(ticket)
        user = User.find_by_id(ticket.user_id)
        email = user.email
        puts "This ticket #{ticket.title} went to #{user.email}"
        return if ENV['RAILS_ENV'] == 'test' 
        from = Email.new(email: "#{ENV['FROM_EMAIL']}")
        to = Email.new(email: email)
        subject = ticket.title
        content = Content.new(type: 'text/plain', value: "#{ticket.description}")
        mail = Mail.new(from, subject, to, content)

        sg = SendGrid::API.new(api_key: ENV['SENDGRID_API'])
        response = sg.client.mail._('send').post(request_body: mail.to_json)
        puts "#{response}"

    end 
   
end