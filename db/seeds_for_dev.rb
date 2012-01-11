require 'database_cleaner'
require Rails.root.join('spec', 'support/blueprints')

p '> clean up temp data...'
DatabaseCleaner.strategy = :truncation
DatabaseCleaner.clean

FileUtils.rm_rf(File.join(Rails.root, 'public', 'uploads/*'))

require Rails.root.join('db/data/mandatory_seed')

p "> create admin user..."
User.make!(:admin, :email => 'admin@playab.net')
p "admin user was created."

p "> create blog posts"
30.times do
  post = Post.make!(:user => User.without_admin.sample, :category => Category.all.sample)
  Comment.make!(:post => post)
end

p "> create events..."
7.times do |t|
  time = (t+1).days.ago
  User.without_admin.each do |u|
    Event.make!(:user => u, :checkin_at => time.change(:hour => 9), :checkout_at => time.change(:hour => 18))
  end
end

p "> create products..."
10.times do
	product = Product.make!
	3.times { ProductPhoto.make!(:product => product) }
end