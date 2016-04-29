require 'rails_helper'

describe 'Twitter' do
  it 'should be able to search using the form' do
    VCR.use_cassette('search-twitter-timeline') do
      visit root_path

      fill_in 'account_username', with: 'twitter'

      click_on 'Search'

      expect(page).to have_field 'account_username', with: 'twitter'

      expect(page).to have_content "Dance like nobody's watching"
    end
  end
end
