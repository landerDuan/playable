require 'spec_helper'

describe User do
  
  let :attrs do
    {
      :username => 'john_doe',
      :name     => 'John Doe',
      :email    => 'test@example.com',
      :password => 'password',
    }
  end

  let :attrs2 do
    {
      :username => 'john_doe_2',
      :name     => 'John Doe 2',
      :email    => 'test2@example.com',
      :password => 'password',
    }
  end
  
  context "creation" do
    it "creates a user given valid attributes" do
      User.new(attrs).should be_valid
    end

    it "requires a username" do
      User.new(attrs.merge(:username => '')).should_not be_valid
    end

    it "rejects a username that contains illegal characters" do
      User.new(attrs.merge(:username => 'john_doe')).should be_valid
      User.new(attrs.merge(:username => 'john.doe')).should_not be_valid
      User.new(attrs.merge(:username => 'john-doe')).should_not be_valid
    end

    it "rejects duplicated usernames" do
      User.create!(attrs)
      User.new(attrs2.merge(:username => attrs[:username])).should_not be_valid
    end

    it "rejects duplicated case-insensitive usernames" do
      User.create!(attrs)
      User.new(attrs2.merge(:username => attrs[:username].upcase)).should_not be_valid
    end

    it "requires a name" do
      User.new(attrs.merge(:name => '')).should_not be_valid
    end

    it "rejects a name that is too short" do
      User.new(attrs.merge(:name => 'a')).should_not be_valid
    end

    it "rejects a name that is too long" do
      User.new(attrs.merge(:name => 'a' * 100)).should_not be_valid
    end

    it "rejects an invalid email address" do
      User.new(attrs.merge(:email => 'invalid_email')).should_not be_valid
    end

    it "rejects duplicated email addresses" do
      User.create!(attrs)
      User.new(attrs2.merge(:email => attrs[:email])).should_not be_valid
    end
  end
  
  context "persistence" do
    it "normalises the email address" do
      user = User.new(attrs.merge(:email => 'TESTme@EXAMPLE.com'))
      user.save(:validate => false)

      user.email.should == 'testme@example.com'
    end
  end

  context "password validation" do
    def test_invalid_user_password(password, password_confirmation = nil)
      User.new(attrs.merge(
        :password              => password,
        :password_confirmation => (password || password_confirmation)
      )).should_not be_valid
    end

    it "requires a password" do
      test_invalid_user_password('')
    end

    it "requires a matching password confirmation" do
      test_invalid_user_password('a', 'b')
    end

    it "rejects a password that is too short" do
      test_invalid_user_password('a')
    end
  end
  
  context "methods" do
    subject { User.make! }
    
    it 'notifiers' do
      subject.notifiers.should == { :should_checkin => true, :should_report => true }
    end
    
    it 'has checked in?' do
      subject.has_checked_in?.should be_false
      subject.notifiers.has_key?(:should_checkin).should be_true
    end
    
    it 'has checked out?' do
      subject.has_checked_out?.should be_false
      subject.notifiers.has_key?(:should_checkout).should be_false
    end
    
    it 'checkin' do
      subject.checkin
      subject.has_checked_in?.should be_true
      subject.notifiers.has_key?(:should_checkin).should be_false
      
      subject.checkin
      subject.events.count.should == 1
    end
    
    it 'checkout' do
      subject.checkin
      subject.checkout
      
      subject.has_checked_out?.should be_true
      subject.events.count.should == 1
      subject.notifiers.has_key?(:should_checkout).should be_false
    end
    
    it 'has reported' do
      subject.has_reported?.should be_false
      subject.notifiers.has_key?(:should_report).should be_true
    end
    
    it 'report on current day' do
      subject.report_on_current_day.should be_nil
      
      report = Report.make!(:user => subject)
      
      subject.report_on_current_day.should == report
    end
    
    it 'event on current day' do
      subject.event_on_current_day.should be_nil
      
      event = Event.make!(:user => subject)
      
      subject.event_on_current_day.should == event
    end
  end
  
end
