class TwitterSearcher
  attr_reader :account

  LIMIT = 25

  class << self
    def client
      @@client
    end

    def client=(client)
      @@client = client
    end
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
