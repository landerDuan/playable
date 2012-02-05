require 'database_cleaner'
require Rails.root.join('spec', 'support/blueprints')

p '> clean up temp data...'
DatabaseCleaner.strategy = :truncation
DatabaseCleaner.clean

Dir.glob(Rails.root.join('public', 'uploads', '**')).each { |dir| FileUtils.rm_rf(dir) }

require Rails.root.join('db/data/mandatory_seed')

p "> create blog posts"
30.times do
  post = Post.make!(:user => User.without_admin.sample, :category => Category.all.sample)
end

p "> create events..."
start_data = 90.days.ago
90.times do |t|
  #time = (t+1).days.ago
  time = start_data+t.day
  User.without_admin.each do |u|
    Event.make!(:user => u, :checkin_at => time.change(:hour => 9), :checkout_at => time.change(:hour => 18), :created_at => time)
  end
end

p "> create products..."
10.times do
	product = Product.make!
	3.times { ProductPhoto.make!(:product => product) }
end

p "> create reports..."
start_data = 90.days.ago
90.times do |t|
  #time = (t+1).days.ago
  time = start_data+t.day
  User.without_admin.each do |u|
    Report.make!(:user => u, :created_at => time)
  end
end