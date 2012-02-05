# encoding: utf-8

[User, Role, Category, Page, Post].map(&:destroy_all)

Dir.glob(Rails.root.join('public', 'uploads', '**')).each { |dir| FileUtils.rm_rf(dir) }

require Rails.root.join('db/data/mandatory_seed')