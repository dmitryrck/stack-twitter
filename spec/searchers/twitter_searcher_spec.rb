require 'rails_helper'

describe TwitterSearcher do
  context 'when arg is a object that does not respond to username' do
    subject do
      TwitterSearcher.new('something')
    end

    it 'should return a empty array' do
      expect(subject.search!).to be_empty
    end
  end

  context 'when arg is a object that has no account' do
    subject do
      TwitterSearcher.new(Account.new)
    end

    it 'should return a empty array' do
      expect(subject.search!).to be_empty
    end
  end

  context 'when arg is a object with username' do
    subject do
      TwitterSearcher.new(account)
    end

    let(:account) do
      Account.new(username: 'twitter')
    end

    it 'should return a empty array' do
      VCR.use_cassette('search-twitter-timeline') do
        expect(subject.search!).not_to be_empty
      end
    end
  end
end
