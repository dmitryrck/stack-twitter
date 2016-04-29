RSpec.configure do |config|
  config.before(:all) do
    TwitterSearcher.client = Twitter::REST::Client.new { |config|
      config.consumer_key    = 'CONSUMER_KEY'
      config.consumer_secret = 'CONSUMER_SECRET'
    }
  end
end
