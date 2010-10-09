require File.dirname(__FILE__) + '/../spec_helper'

describe CapybaraEmail::Inbox do
  include CapybaraEmail::Inbox

  before do
    reset_mailer
    ActionMailer::Base.perform_deliveries = true
    send_email
  end

  describe 'using cache_mailer' do
  
    it 'should have 1 email in the inbox' do
      inbox.size.should == 1
    end

    it 'should have 2 emails if I send another one' do
      send_email(:to => 'joe@example.host', :subject => 'Second email')
      inbox.size.should == 2
    end

  end
end
