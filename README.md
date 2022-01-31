# Reminder

send tickets via email to user based on user's preference.

## Tech Used
- [Ruby](https://www.ruby-lang.org/en/) - Ruby programming languge (2.6.6)
- [Ruby On Rails](https://rubyonrails.org/) - Ruby on rails (5.2.6)
- [Send Grid](https://sendgrid.com/) - Send Grid to send Emails
- [MySql](https://www.mysql.com/) - Database to hold tickets & Users.

## Features Implemented
- After create a new ticket new notification with email send to related user.
- Successfull email devlivery update ticket with status.
- Define any upcomming notification service in NotifyHelper adding to `RegisterServices` and implement `send` function.
- create and save User and Ticket to database.
- Can Activate / Deactivate user from console.

## Installation

Dillinger requires [Ruby](https://www.ruby-lang.org/en/) v2.6.6 to run.

Install the dependencies and creating database.

```sh
cd reminder
 ./bin/setup
```

## Development
To use the project in development mode
copy `env.sample` file to `.env` and replace varibles inside

```sh
cp env.sample .env
rails c
```

To run tests
```sh
rspec
```


## License

MIT
