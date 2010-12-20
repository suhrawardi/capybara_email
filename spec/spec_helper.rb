def delivery_method
  ENV['DELIVERY_METHOD'] ? ENV['DELIVERY_METHOD'].to_sym : :cache
end

require 'rubygems'
require 'action_mailer'
ActionMailer::Base.delivery_method = delivery_method

require 'rspec'
require 'mail'
require 'cache_mailer'
require 'capybara_email/inbox'
require File.expand_path(File.dirname(__FILE__) + '/../lib/capybara_email.rb')

puts "Using the #{ActionMailer::Base.delivery_method} delivery method"

class SpecEmail < ActionMailer::Base
  default :from => 'mail@test.host'
  
  def send_one(opts={})
    default_opts = {:to => 'someone@test.host',
                    :plain_text_content => 'Plain text content',
                    :html_content => '<p>HTML content</p>',
                    :text_content => 'TEXT content',
                    :subject => 'Email subject'}
    opts = default_opts.merge(opts)
    mail(:to => opts[:to], :subject => opts[:subject]) do |format|
      format.text { render :text => opts[:text_content] }
      format.html { render :text => opts[:html_content] }
    end
  end
end

def send_email(opts={})
  mail = SpecEmail.send_one(opts)
  mail.deliver
end
