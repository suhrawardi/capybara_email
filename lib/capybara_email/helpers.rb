require 'uri'
require 'capybara_email/deliveries'

module CapybaraEmail
  module Helpers
    include Deliveries

    def last_email
      all_email.first
    end

    def email_send_to(to)
      all_emails.find do |m|
        m.to =~ /#{to}/
      end.first
    end

    def email_send_by(from)
      all_emails.find do |m|
        m.from =~ /#{from}/
      end.first
    end

    def email_with_subject(subject)
      all_emails.find do |m|
        m.subject =~ /#{subject}/
      end.first
    end

    def parse_email_count(amount)
      case amount
      when "no"
        0
      when "an"
        1
      else
        amount.to_i
      end
    end
  end
end
