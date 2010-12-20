require 'nokogiri'

module CapybaraEmail::MailExt
  def default_part
    @default_part ||= html_part || text_part || self
  end

  def message_body
    default_part.body.raw_source
  end

  def link(value)
    msg_body = default_part.message_body
    doc = Nokogiri::HTML.parse(msg_body)
    doc.xpath('//a').first
  end

  def url_to(value)
    link(value)[:href]
  end
end

Mail::Message.send(:include, CapybaraEmail::MailExt)
