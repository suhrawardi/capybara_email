require 'capybara_email/deliveries'

module CapybaraEmail
  module Inbox
    include Deliveries

    def empty_inbox!
      reset_mailer
    end

    def inbox
      all_emails.reverse
    end

    def open_email(selector=nil, value=nil)
      if selector.nil?
        last_email
      else
        f = :"open_email_#{selector.to_s.gsub(' ', '_')}"
        send(f, value)
      end
    end

    def last_email
      all_emails.last || raise('No email has been send yet!')
    end

    def open_email_to(to)
      inbox.find do |m|
        m.to =~ /#{to}/
      end
    rescue
      raise('Nothing found')
    end

    def open_email_from(from)
      inbox.find do |m|
        m.from =~ /#{from}/
      end
    rescue
      raise('Nothing found')
    end

    def open_email_with_subject(subject)
      inbox.find do |m|
        m.subject =~ /#{subject}/
      end
    rescue
      raise('Nothing found')
    end

    def to_nr(nr)
      {'no' => 0, 'an' => 1}[nr] || nr.to_i
    end
  end
end
