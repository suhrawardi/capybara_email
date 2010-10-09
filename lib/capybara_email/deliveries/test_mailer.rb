module CapybaraEmail
  module Deliveries
    module TestMailer
      def all_emails
        mailer.deliveries
      end

      def reset_mailer
        puts 'Cleaning the :test deliveries' if $DEBUG
        mailer.deliveries = []
      end
    end
  end
end
