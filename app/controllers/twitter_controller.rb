class TwitterController < ApplicationController
  def index
    @account = Account.new
  end

  def search
    @account = Account.new account_params
    searcher = TwitterSearcher.new(@account)
    @account.tweets = searcher.search!
  end

  def account_params
    params.require(:account).permit(:username)
  end
end
