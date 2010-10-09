module CapybaraEmail
  module Deliveries
    module CacheMailer
      def all_emails
        d = mailer.deliveries
        puts d.inspect if $DEBUG
        d
      end

      def reset_mailer
        mailer.clear_cache!
      end
    end
  end
end
