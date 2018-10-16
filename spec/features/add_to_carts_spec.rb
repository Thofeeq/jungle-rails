require 'rails_helper'

RSpec.feature "AddToCarts", type: :feature, js: true do
  before :each do
    @category = Category.create! name: 'Apparel'

    10.times do |n|
      @category.products.create!(
        name:  Faker::Hipster.sentence(3),
        description: Faker::Hipster.paragraph(4),
        image: open_asset('apparel1.jpg'),
        quantity: 10,
        price: 64.99
      )
    end
  end

  scenario "The cart quantity updates itself" do
    visit root_path
    #Make sure that intial condition is met
    within(:link,href: "/cart") { expect(page).to have_content("My Cart (0)") }
    first(:button,"Add").click
    #Check to see if my car has been updated
    within(:link,href: "/cart") { expect(page).to have_content("My Cart (1)") }
    save_screenshot
  end
end
