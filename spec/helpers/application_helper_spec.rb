require 'rails_helper'

describe ApplicationHelper do
  context '#formatted_tweet_text' do
    it 'returns link with username' do
      expect(formatted_tweet_text('Hi @twitter!')).to eq 'Hi <a href="http://www.twitter.com/twitter">@twitter</a>!'
    end

    it 'returns http link' do
      expect(formatted_tweet_text('Go to http://example.de!')).to eq 'Go to <a href="http://example.de">http://example.de</a>!'
    end

    it 'returns https link' do
      expect(formatted_tweet_text('Go to https://example.com!')).to eq 'Go to <a href="https://example.com">https://example.com</a>!'
    end
  end
end
