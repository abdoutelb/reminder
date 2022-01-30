
class EmailNotification 
    require 'sendgrid-ruby'
    include SendGrid

    def self.send(ticket)
        user = ticket.user
        sent_at = (user.prefered_time).to_i 
        return "This ticket #{ticket.title} went to #{user.email}" if ENV['RAILS_ENV'] == 'test' 
        puts "This ticket #{ticket.title} went to #{user.email}"
 
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
        ticket.sent if response.status_code.start_with?("20")

    end 
   
end