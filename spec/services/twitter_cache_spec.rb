require 'rails_helper'

describe TwitterCache do
  before do
    allow(TwitterCache.redis).to receive(:get).and_return(cached)
  end

  subject do
    TwitterCache.get('john') do
      [tweet]
    end
  end

  let(:tweet) do
    Tweet.new(created_at: created_at, text: 'Hi!')
  end

  let(:created_at) do
    Date.current
  end

  context 'when there is cache' do
    let(:cached) do
      Marshal.dump([{ created_at: created_at, text: 'Hi from cache!' }])
    end

    it 'should return cache' do
      expect(subject[0].text).to eq 'Hi from cache!'
    end
  end

  context 'when there is no cache' do
    let(:cached) do
      nil
    end

    it 'should call the block' do
      allow(TwitterCache.redis).to receive(:setex).and_return(true)

      expect(subject).to eq [tweet]
    end

    it 'should call the block' do
      expect(TwitterCache.redis).to receive(:setex).and_return(true)

      subject
    end
  end
end
