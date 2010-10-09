require 'capybara_email/deliveries/cache_mailer'

module CapybaraEmail

  module Deliveries
    def mailer; Mail::CacheMailer; end
    include CapybaraEmail::Deliveries::CacheMailer
  end
end

