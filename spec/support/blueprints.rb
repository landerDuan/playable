require 'machinist/active_record'

User.blueprint do
  username      { "username_#{sn}" }
  name          { Faker::Name.name }
  email         { Faker::Internet.email }
  password      { "password" }
  bio           { Faker::Lorem.paragraph }
  confirmed_at  { Time.zone.now }
end

User.blueprint(:admin) do
  is_admin { true }
end

Report.blueprint do
  user    { User.make! }
  plan    { Faker::Lorem.paragraph }
  goal    { Faker::Lorem.paragraph }
  content { Faker::Lorem.paragraph }
  score   { rand(10) }
end

Category.blueprint do
  name  { "category_#{sn}" }
  code  { object.name }
end

Page.blueprint do
  code      { "code_1" }
  name_zh   { Faker::NameCN.name }
  name_en   { Faker::Name.name }
  name_jp   { object.name_zh }
  position  { [:top, :bottom, :top_and_bottom].sample }
end

Event.blueprint do
end

Role.blueprint do
  # Attributes here
end

Post.blueprint do
  title     { Faker::LoremCN.sentence }
  permalink { Faker::Lorem.sentence.to_url }
  content   { Faker::LoremCN.paragraph(5) }
  category  { Category.make! }
  user      { User.make! }
end

Comment.blueprint do
  # Attributes here
end

Product.blueprint do
  # Attributes here
end

ProductPhoto.blueprint do
  # Attributes here
end
