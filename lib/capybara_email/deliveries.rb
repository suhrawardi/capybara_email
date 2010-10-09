require 'capybara_email/deliveries/cache_mailer'
require 'capybara_email/deliveries/test_mailer'

module CapybaraEmail

  module Deliveries
    if ActionMailer::Base.delivery_method == :cache
      def mailer; Mail::CacheMailer; end
      include CapybaraEmail::Deliveries::CacheMailer
    elsif ActionMailer::Base.delivery_method == :test
      def mailer; Mail::TestMailer; end
      include CapybaraEmail::Deliveries::TestMailer
    else
      puts ActionMailer::Base.delivery_method.inspect if $DEBUG
      raise('Unsupported ActionMailer delivery method')
    end
  end
end
