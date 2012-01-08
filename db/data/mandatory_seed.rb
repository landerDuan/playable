# encoding: utf-8

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