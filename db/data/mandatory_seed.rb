# encoding: utf-8

p "> create role..."
[
  { :name => '签到使用',  :code => 'checkin_user'},
  { :name => '签到管理',  :code => 'checkin_admin'},
  { :name => '日报使用',  :code => 'report_user'},
  { :name => '日报管理',  :code => 'report_admin'},
  { :name => '博客使用',  :code => 'blog_user'},
  { :name => '超级管理员', :code => 'administrator' }
].each do |role|
  Role.create(:name => role[:name], :code => role[:code])
end

p "> create users..."
[
  { :username => 'duanlipei', :name => '段力佩', :position => 'CEO',   :email => 'duan@playab.net',  :roles => ['administrator'] },
  { :username => 'sunchenxu', :name => '孙晨旭', :position => 'STAFF', :email => 'suncx@playab.net', :roles => ['checkin_user', 'report_user', 'blog_user'] },
  { :username => 'lipeng',    :name => '李鹏',  :position => 'STAFF', :email => 'li@playab.net',    :roles => ['checkin_user', 'report_user', 'blog_user'] }
].each do |user|
  u = User.create(
    :username     => user[:username],
    :name         => user[:name],
    :position     => user[:position],
    :email        => user[:email],
    :password     => 'password',
    :confirmed_at => Time.zone.now
  )
  
  Role.find_all_by_code(user[:roles]).each do |role|
    u.roles << role
  end
  u.save!
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