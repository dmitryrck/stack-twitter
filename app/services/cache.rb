class Cache
  CACHE_TIME = 18_000

  class << self
    def redis
      @@redis
    end

    def redis=(redis)
      @@redis = redis
    end
  end

  def self.get(username, &block)
    if current = redis.get(username)
      Marshal.load(current).map do |tweet|
        Tweet.new(tweet)
      end
    else
      tweets = block.call

      redis.setex(username, CACHE_TIME, Marshal.dump(turn_cachable_tweets(tweets)))

      tweets
    end
  end

  private

  def self.turn_cachable_tweets(tweets)
    tweets.map do |tweet|
      {
        created_at: tweet.created_at,
        text: tweet.text
      }
    end
  end
end