require 'database_cleaner'
require Rails.root.join('spec', 'support/blueprints')

p '> clean up temp data...'
DatabaseCleaner.strategy = :truncation
DatabaseCleaner.clean

FileUtils.rm_rf(File.join(Rails.root, 'public', 'uploads'))

p "> create admin user..."
User.make!(:admin, :email => 'admin@playable.com')
p "admin user was created."

