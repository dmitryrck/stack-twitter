class Cache
  CACHE_TIME = 18_000

  class << self
    mattr_accessor :redis

    def redis
      @@redis ||= Redis.new(host: redis_uri.host, port: redis_uri.port, password: redis_uri.password)
    end

    def redis=(redis)
      @@redis = redis
    end

    def get(username, &block)
      if redis && current = redis.get(username)
        Marshal.load(current).map do |tweet|
          Tweet.new(tweet)
        end
      else
        tweets = block.call

        if redis
          redis.setex(username, CACHE_TIME, Marshal.dump(turn_cachable_tweets(tweets)))
        end

        tweets
      end
    end

    def turn_cachable_tweets(tweets)
      tweets.map do |tweet|
        {
          created_at: tweet.created_at,
          text: tweet.text
        }
      end
    end

    def redis_uri
      @@redis_uri ||= URI.parse(ENV['REDISTOGO_URL'])
    end
  end

  private_class_method :turn_cachable_tweets, :redis_uri
end
