module CapybaraEmail
  module Deliveries
    module TestMailer
      def all_emails
        d = mailer.deliveries
        puts d.inspect if $DEBUG
        d
      end

      def reset_mailer
        mailer.deliveries = []
      end
    end
  end
end
