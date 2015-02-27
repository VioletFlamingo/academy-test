include Warden::Test::Helpers
Warden.test_mode!

# Feature: City delete
#   As a user
#   I want to delete a city
feature 'City delete', :devise, :js do

  after(:each) do
    Warden.test_reset!
  end

  # Scenario: User can delete a city
  #   Given I am signed in
  #   When I delete a city
  #   Then I should not see the city anymore
  scenario 'user can delete a city' do
    #skip 'slow test -- selenium'
    user = FactoryGirl.create(:user)
    city = FactoryGirl.create(:city)
    login_as(user, scope: :user)
    visit cities_path
    expect(page).to have_content city.name
    page.find_by_id('d'+city.id.to_s).click
    page.driver.browser.switch_to.alert.accept
    expect(page).not_to have_content city.name
  end

end