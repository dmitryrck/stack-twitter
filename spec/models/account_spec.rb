require 'rails_helper'

describe Account do
  subject do
    Account.new(username: 'twitter')
  end

  it { is_expected.to be_valid }

  it 'should not be valid with no username' do
    subject.username = nil
    expect(subject).not_to be_valid
  end

  it 'returns username as to_s' do
    expect(subject.to_s).to eq 'twitter'
  end
end
