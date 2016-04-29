module ApplicationHelper
  def replace_mentions(text)
    text.gsub(%r_@[a-zA-Z0-9]*_) { |name|
      name_without_mention = name.gsub('@', '')

      %[<a href="http://www.twitter.com/#{name_without_mention}">#{name_without_mention}</a>]
    }.html_safe
  end
end
