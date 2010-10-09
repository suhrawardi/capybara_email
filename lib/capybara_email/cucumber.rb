# require this in your env.rb file after you require cucumber/rails/world

# Global Setup
if defined?(ActionMailer)
  ActionMailer::Base.delivery_method = :cache
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
