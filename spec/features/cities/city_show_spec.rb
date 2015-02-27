include Warden::Test::Helpers
Warden.test_mode!

# Feature: Cities page
#   As a user
#   I want to visit cities page
#   So I can see created cities
feature 'Cities page', :devise, :js do

  after(:each) do
    Warden.test_reset!
  end

  # Scenario: User sees already created cities
  #   Given I am signed in
  #   When I visit cities page
  #   Then I see already created cities
  scenario 'user sees created cities' do
    user = FactoryGirl.create(:user)
    city = FactoryGirl.create(:city)
    login_as(user, scope: :user)
    visit cities_path
    expect(page).to have_content city.name
  end

  # Scenario: User sees cities page after clicking button
  #   Given I am signed in
  #   When I click on Cities button
  #   Then I see /cities page
  scenario 'user sees cities page' do
    user = FactoryGirl.create(:user)
    login_as(user, scope: :user)
    visit user_path(user)
    click_link "Cities"
    expect(page).to have_content "Name"
    expect(page).to have_content "Short name"
  end

end