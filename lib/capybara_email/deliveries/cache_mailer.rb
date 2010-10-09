module CapybaraEmail
  module Deliveries
    module CacheMailer
      def all_emails
        mailer.deliveries
      end

      def reset_mailer
        puts 'Cleaning the :cache deliveries' if $DEBUG
        mailer.clear_cache!
      end
    end
  end
end
