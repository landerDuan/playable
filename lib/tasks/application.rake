unless Rails.env.production?
  namespace :dev do
    namespace :db do
      desc "recreates the development database from migration, and updates the db schema if necessary"
      task :reset => :environment do
        require File.dirname(__FILE__) + '/../../db/seeds_for_dev' unless Rails.env.test?
      end
    end
  end
end