module CapybaraEmail
  module MailerDeliveries
    def all_emails
      d = mailer.deliveries
      puts d.inspect if $DEBUG
      d
    end

    def last_email_sent
      mailer.deliveries.last || raise("No email has been sent!")
    end

    def reset_mailer
      mailer.clear_cache!
    end

    def mailbox_for(address)
      mailer.deliveries.select do |email|
        (email.to && email.to.include?(address)) ||
        (email.bcc && email.bcc.include?(address)) ||
        (email.cc && email.cc.include?(address))
      end
    end
  end

  module Deliveries
    def mailer; Mail::CacheMailer; end
    include CapybaraEmail::MailerDeliveries
  end
end

