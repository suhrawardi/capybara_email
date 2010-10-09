require File.dirname(__FILE__) + '/../spec_helper'

describe CapybaraEmail::Inbox do
  include CapybaraEmail::Inbox

  before do
    empty_inbox!
    ActionMailer::Base.perform_deliveries = true
    send_email
  end

  describe 'the size of the inbox' do
  
    it 'should have 1 email in the inbox' do
      inbox.size.should == 1
    end

    it 'should have 2 emails if I send another one' do
      send_email(:to => 'joe@test.host', :subject => 'Second email')
      inbox.size.should == 2
    end
  
    it 'should be empty after clearing it' do
      empty_inbox!
      inbox.should be_empty
    end
  end

  describe 'finding an email' do
    before do
      send_email(:to => 'john@test.host', :subject => 'Just an email')
      send_email(:to => 'rob@test.host', :subject => 'Just an email')
      send_email(:to => 'jenny@test.host', :subject => 'Third email')
    end
    
    it 'should find the last email' do
      send_email(:to => 'joe@test.host', :subject => 'Fourth email')
      open_email.subject.should == 'Fourth email'
    end

    it 'should raise a decent error on an empty inbox' do
      empty_inbox!
      expected_error = 'No email has been send yet!'
      lambda{ open_email }.should raise_error expected_error
    end

    it 'should find an email with a given subject' do
      open_email(:with_subject, 'Just').to.should include('rob@test.host')
    end

    it 'should find an email for a given addressee' do
      open_email(:to, 'joe@test.host').subject.should == 'Fourth email'
    end
  end

  describe 'finding an email by sender' do
  end

  describe 'finding an email by receiver' do
  end

  describe 'finding an email by subject' do
  end
end
