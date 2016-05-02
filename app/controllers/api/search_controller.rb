class Api::SearchController < ApplicationController
  def by_username
    @account = Account.new account_params
    @account.tweets = tweets(@account)
  end

  protected

  def account_params
    params.require(:account).permit(:username)
  end

  def tweets(account)
    Cache.get(account.username) do
      Searcher.search!(account)
    end
  end
end
