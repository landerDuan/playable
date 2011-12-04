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

User.blueprint(:admin) do
  is_admin { true }
end

Report.blueprint do
  # Attributes here
end

Mark.blueprint do
end

Group.blueprint do
  # Attributes here
end

Role.blueprint do
  # Attributes here
end
