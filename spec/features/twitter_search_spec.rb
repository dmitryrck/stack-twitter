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

  it 'should render not found accounts', js: true do
    VCR.use_cassette('search-not-found-timeline') do
      visit root_path

      expect(page).to have_field 'account_username'
      fill_in 'account_username', with: 'dmitrynix'

      click_on 'Search'

      expect(page).to have_field 'account_username', with: 'dmitrynix'
      expect(page).to have_content 'Account Not Found'
    end
  end

  it 'should render permission denied for some accounts', js: true do
    VCR.use_cassette('search-no-permission-timeline') do
      visit root_path

      expect(page).to have_field 'account_username'
      fill_in 'account_username', with: '12345'

      click_on 'Search'

      expect(page).to have_field 'account_username', with: '12345'
      expect(page).to have_content 'Unauthorized'
    end
  end
end
