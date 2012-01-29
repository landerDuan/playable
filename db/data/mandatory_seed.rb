# encoding: utf-8

p "> create users..."
[
  { :username => 'duanlipei', :name => 'asdfas', :position => 'CEO',   :email => 'duan@playab.net' },
  { :username => 'sunchenxu', :name => '孙晨旭', :position => 'STAFF', :email => 'suncx@playab.net' },
  { :username => 'lipeng',    :name => '李鹏',  :position => 'STAFF', :email => 'li@playab.net' }
].each do |user|
  User.create(
    :username     => user[:username],
    :name         => user[:name],
    :position     => user[:position],
    :email        => user[:email],
    :password     => 'password',
    :confirmed_at => Time.zone.now
  )
end

p "> create statics pages..."
[
  { :code => 'about',   :position => :top_and_bottom, :name_zh => '关于我们', :name_en => 'About' },
  { :code => 'jobs',    :position => :top_and_bottom, :name_zh => '职位招聘', :name_en => 'Jobs' },
  { :code => 'privacy', :position => :bottom, :name_zh => '隐私政策', :name_en => 'Privacy & Policy' }
].each do |page|
  Page.create(
    :code     => page[:code],
    :position => page[:position],
    :name_zh  => page[:name_zh],
    :name_en  => page[:name_en],
    :name_jp  => page[:name_zh]
  )
end

p "> create categories..."
[
  { :name => '公司新闻', :code => 'news' },
  { :name => '团队故事', :code => 'team' },
  { :name => '技术讨论', :code => 'technology' }
].each do |cat|
  Category.create(:name => cat[:name], :code => cat[:code])
end

p "> create role..."
[
  { :name => '签到使用权限', :code => 'checkin_user'},
  { :name => '签到管理权限', :code => 'checkin_admin'},
  { :name => '日报使用权限', :code => 'event_user'},
  { :name => '日报管理权限', :code => 'event_admin'},
  { :name => '博客使用权限', :code => 'blog_user'},
  { :name => '博客管理权限', :code => 'blog_admin'},
  { :name => '用户管理权限', :code => 'user_admin'}
].each do |role|
  Role.create(:name => role[:name], :code => role[:code])
end