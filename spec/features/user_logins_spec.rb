require 'rails_helper'

RSpec.feature "UserLogins", type: :feature do
  scenario "Upon a successful login try, takes user to appropriate page" do
    visit root_path
    click_on "Login"

    User.create!(first_name:"Anything",last_name: "Anything", email: "test@test.test",
      password: "test123", password_confirmation: "test123" ) 
      fill_in 'email', with: 'test@test.test'
      fill_in 'password', with: 'test123'
      click_on "Submit"
    
    within(".navbar"){expect(page.has_content?("Signed in as test@test.test")).to be true}
  end
end
