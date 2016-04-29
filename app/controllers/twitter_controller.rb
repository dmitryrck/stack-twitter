class TwitterController < ApplicationController
  def index
    @account = Account.new
  end

  def search
    @account = Account.new account_params
    render 'index'
  end

  def account_params
    params.require(:account).permit(:username)
  end
end
