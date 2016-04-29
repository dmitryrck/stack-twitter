require 'rails_helper'

RSpec.describe User, type: :model do
  subject do
    User.new(email: 'user@example.com', password: 'secret')
  end

  it { is_expected.to be_valid }

  it 'should not be valid with no email' do
    subject.email = nil
    expect(subject).not_to be_valid
  end
end
