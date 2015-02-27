include Warden::Test::Helpers
Warden.test_mode!

# Feature: City new
#   As a user
#   I want to create new city
feature 'City new', :devise, :js do

  after(:each) do
    Warden.test_reset!
  end

  # Scenario: User can create new city
  #   Given I am signed in
  #   When I create new city
  #   Then I should see it on /cities page
  scenario 'user can create new a city' do
    user = FactoryGirl.create(:user)
    login_as(user, scope: :user)
    visit cities_path
    expect(page).not_to have_content "London"
    expect(page).not_to have_content "Ld"

    visit new_city_path
    fill_in 'Name', :with => 'London'
    fill_in 'Short name', :with => 'Ld'
    click_button 'Create City'

    visit cities_path
    expect(page).to have_content "London"
    expect(page).to have_content "Ld"
  end

end