class TwitterController < ApplicationController
  def index
    @account = Account.new
  end

  def search
    @account = Account.new account_params
    @account.tweets = tweets(@account)
  end

  protected

  def account_params
    params.require(:account).permit(:username)
  end

  def tweets(account)
    TwitterCache.get(account.username) do
      TwitterSearcher.search!(account)
    end
  end
end
