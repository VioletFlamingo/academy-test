include Warden::Test::Helpers
Warden.test_mode!

# Feature: City update
#   As a user
#   I want to update a city
feature 'City update', :devise, :js do

  after(:each) do
    Warden.test_reset!
  end

  # Scenario: User can update a city
  #   Given I am signed in
  #   When I update a city
  #   Then I should see the updated city on cities page
  scenario 'user can update a city' do
    user = FactoryGirl.create(:user)
    city = FactoryGirl.create(:city)
    login_as(user, scope: :user)
    visit cities_path
    expect(page).to have_content city.name
    expect(page).to have_content city.short_name

    page.find_by_id('e'+city.id.to_s).click
    fill_in 'Name', :with => 'Paris'
    fill_in 'Short name', :with => 'Pr'
    click_button 'Update City'

    expect(page).to have_content "Paris"
    expect(page).to have_content "Pr"
  end

end