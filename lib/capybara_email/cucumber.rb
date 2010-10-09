# require this in your env.rb file after you require cucumber/rails/world
require 'capybara_email/inbox'

# Global Setup
if defined?(ActionMailer)
  unless [:test, :cache].include?(ActionMailer::Base.delivery_method)
    ActionMailer::Base.delivery_method = :cache
  end
  ActionMailer::Base.perform_deliveries = true

  Before do
    # Scenario setup
    case ActionMailer::Base.delivery_method
      when :cache then Mail::CacheMailer.clear_cache!
      when :test then Mail::TestMailer.deliveries.clear
    end
  end
end

World(CapybaraEmail::Inbox)
