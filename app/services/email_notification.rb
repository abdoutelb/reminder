require 'sendgrid-ruby'
class EmailNotification 
    include SendGrid

    def self.send(ticket)
        user = ticket.user
        sent_at = (user.prefered_time).to_i 
        puts "This ticket #{ticket.title} went to #{user.email}"
        return if ENV['RAILS_ENV'] == 'test' 
 
        data = '{
            "personalizations": [
                {
                "send_at": %{time} ,
                "to": [
                    {
                    "email": "%{email}"
                    }
                ],
                "subject": "%{subject}"
                }
            ],
            "from": {
                "email": "%{from}"
            },
            "content": [
                {
                "type": "text/plain",
                "value": "%{desc}"
                }
            ]
            }' % {email: user.email, time: sent_at,  subject: ticket.title, from: ENV['FROM_EMAIL'] ,desc:ticket.description }  
    
        sg = SendGrid::API.new(api_key: ENV['SENDGRID_API'])
        response = sg.client.mail._('send').post(request_body: JSON.parse(data))
        puts "#{response.status_code}"
        ticket.sent

    end 
   
end