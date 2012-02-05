require 'spec_helper'

describe Role do
  let(:role1) { Role.make!(:code => 'event_admin') }
  let(:role2) { Role.make!(:code => 'report_admin') }
  
  it 'should assign role event admin to user' do
    user = User.make!
    
    user.roles << role1
    
    user.has_role?('event_admin').should be_true
    user.has_role?('report_admin').should be_false
    user.can_manage_events?.should be_true
  end
  
  it 'should assign role report admin to user' do
    user = User.make!
    
    user.roles << role2
    
    user.has_role?('report_admin').should be_true
    user.has_role?('event_admin').should be_false
    user.can_manage_reports?.should be_true
  end
  
end