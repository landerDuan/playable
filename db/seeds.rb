# encoding: utf-8

[User, Role, Category, Page, Post].map(&:destroy_all)

require Rails.root.join('db/data/mandatory_seed')