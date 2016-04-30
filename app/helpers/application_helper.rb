module ApplicationHelper
  def formatted_tweet_text(text)
    replace_mentions(replace_links(text)).html_safe
  end

  private

  def replace_mentions(text)
    text.gsub(%r_@[a-zA-Z0-9]*_) { |name|
      name_without_mention = name.gsub('@', '')

      %[<a href="http://www.twitter.com/#{name_without_mention}">@#{name_without_mention}</a>]
    }
  end

  def replace_links(text)
    text.gsub(%r_http(s)?\:\/\/[a-z0-9\.]*_) { |link|
      %[<a href="#{link}">#{link}</a>]
    }
  end
end
