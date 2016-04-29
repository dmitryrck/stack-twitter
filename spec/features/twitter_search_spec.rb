require 'rails_helper'

describe 'Twitter' do
  it 'should be able to search using the form' do
    visit root_path

    fill_in 'Username', with: 'john'

    click_on 'Search'

    expect(page).to have_field 'Username', with: 'john'
  end
end
