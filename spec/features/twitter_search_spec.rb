require 'rails_helper'

describe 'Twitter' do
  before do
    sign_in user
  end

  let(:user) do
    User.create email: 'user@example.com', password: 'secret'
  end

  it 'should be able to search using the form', js: true do
    VCR.use_cassette('search-twitter-timeline') do
      visit root_path

      expect(page).to have_field 'account_username'
      fill_in 'account_username', with: 'twitter'

      click_on 'Search'

      expect(page).to have_field 'account_username', with: 'twitter'

      expect(page).to have_content "Dance like nobody's watching"
    end
  end
end
