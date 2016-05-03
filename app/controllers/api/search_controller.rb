class Api::SearchController < ApplicationController
  def by_username
    @account = Account.new account_params
    begin
      @account.tweets = tweets(@account)
    rescue Twitter::Error::Unauthorized
      render json: { errors: 'Unauthorized' }, status: 403
    rescue Twitter::Error::NotFound
      render json: { errors: 'Account Not Found' }, status: 404
    end
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
