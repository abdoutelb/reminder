FactoryBot.define do
  factory :user do
    name { Faker::Name.name  }
    email { Faker::Internet.email }
    send_due_reminder_interval { Faker::Number.number(2) }
    send_due_date_reminder { Faker::Boolean.boolean }
    due_date_reminder_time { Time.now }
    time_zone { Faker::Name.name  }
  end

end
