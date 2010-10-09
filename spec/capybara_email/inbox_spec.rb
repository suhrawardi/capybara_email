require File.dirname(__FILE__) + '/../spec_helper'

describe CapybaraEmail::Inbox do
  include CapybaraEmail::Inbox

  before do
    ActionMailer::Base.perform_deliveries = true
    reset_mailer
    mail = SpecEmail.send_one
    mail.deliver
  end

  describe 'using cache_mailer' do
  
    it 'should have 1 email in the inbox' do
      inbox.size.should == 1
    end

  end
end
