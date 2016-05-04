class Searcher
  attr_reader :account

  LIMIT = 25

  class << self
    mattr_accessor :client

    def client
      @@client ||= Twitter::REST::Client.new { |config|
        config.consumer_key    = ENV['CONSUMER_KEY']
        config.consumer_secret = ENV['CONSUMER_SECRET']
      }
    end

    def client=(client)
      @@client = client
    end
  end

  def self.search!(account)
    new(account).search!
  end

  def initialize(account)
    @account = account
  end

  def search!
    return [] unless account.respond_to?(:username)
    return [] if account.username.blank?

    get(account.username)
  end

  private

  def get(username)
    client.user_timeline(username, count: LIMIT, include_rts: true)
  end

  def client
    self.class.client
  end
end
