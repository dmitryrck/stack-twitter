require 'rails_helper'

describe Tweet do
  it 'can set created_at' do
    expect { subject.created_at = 'date' }.to change { subject.created_at }.to 'date'
  end

  it 'can set text' do
    expect { subject.text = 'txt' }.to change { subject.text }.to 'txt'
  end

  it 'returns text as to_s' do
    subject.text = 'Hi'

    expect(subject.to_s).to eq 'Hi'
  end
end
