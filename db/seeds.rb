# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

user = User.create({email:'abdou@example.com',name:'abdou',
    send_due_date_reminder: true,send_due_reminder_interval: 0,
    due_date_reminder_time : Time.now,time_zone: "Egypt"
});

ticket = Ticket.create({title:'task',description: 'development task',user_id: user.id})
