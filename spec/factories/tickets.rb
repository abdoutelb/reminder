FactoryBot.define do
  factory :ticket do
    title { Faker::Name.name }
    description { Faker::Lorem.paragraph }
    due_date {  Time.now }
    status_id { 0 }
    progress { Faker::Number.number(2) }
    user_id { User.first ? User.first.id : create(:user).id }
  end
end
