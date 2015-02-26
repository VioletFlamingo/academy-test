include Warden::Test::Helpers
Warden.test_mode!

# Feature: User index page
#   As a user
#   I want to see a list of users
#   So I can see who has registered
feature 'User index page', :devise do

  after(:each) do
    Warden.test_reset!
  end

  # Scenario: User listed on index page
  #   Given I am signed in
  #   When I visit the user index page
  #   Then I see my own email address
  scenario 'user sees own email address' do
    user = FactoryGirl.create(:user)
    login_as(user, scope: :user)
    visit users_path
    expect(page).to have_content user.email
  end

  # Scenario: /all_users page redirects to /users
  #   Given I am signed in
  #   When I enter /all_users page
  #   Then I get to /users page
  scenario 'user visits /all_users page' do
    user = FactoryGirl.create(:user)
    login_as(user, scope: :user)
    visit '/all_users'
    p current_path
    expect(current_path).to eq users_path
  end

end
