# encoding: utf-8

[User, Role, Category, Page].map(&:destroy_all)

require Rails.root.join('db/data/mandatory_seed')