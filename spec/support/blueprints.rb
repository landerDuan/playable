require 'machinist/active_record'

User.blueprint do
  username  { "username_#{sn}" }
  name      { Faker::Name.name }
  email     { Faker::Internet.email }
  password  { "password" }
  password_confirmation { object.password }
  bio       { Faker::Lorem.paragraph }
  confirmed_at { Time.zone.now }
end