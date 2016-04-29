TwitterSearcher.client = Twitter::REST::Client.new { |config|
  config.consumer_key    = ENV['CONSUMER_KEY']
  config.consumer_secret = ENV['CONSUMER_SECRET']
}
