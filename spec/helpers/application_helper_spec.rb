require 'rails_helper'

describe ApplicationHelper do
  context '#replace_mentions' do
    it 'returns link with username' do
      expect(replace_mentions('Hi @twitter!')).to eq 'Hi <a href="http://www.twitter.com/twitter">@twitter</a>!'
    end
  end
end
