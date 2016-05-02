require 'rails_helper'

describe Api::SearchController do
  before { sign_in user }

  let(:user) do
    User.create(email: 'user@example.com', password: 'secret')
  end

  context 'POST search' do
    it 'return from cache' do
      allow(Cache).to receive(:get).with('twitter').and_return([])

      post :by_username, account: { username: 'twitter' }, format: :json

      expect(assigns[:account].tweets).to eq []
    end

    it 'store search result' do
      VCR.use_cassette('search-twitter-timeline') do
        post :by_username, account: { username: 'twitter' }, format: :json
      end

      expect(assigns[:account].tweets).not_to be_blank
    end
  end
end
