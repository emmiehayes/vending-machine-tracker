require 'rails_helper'

feature 'When a user visits an item show page' do
  scenario 'they see the name,price,for the snack' do
    owner = Owner.create(name: "Sam's Snacks")
    dons  = owner.machines.create(location: "Don's Mixed Drinks")
    sprite = dons.items.create(name: 'Sprite', price: 1.50)

    visit item_path(sprite)

    expect(page).to have_content("Sprite")
    expect(page).to have_content(1.50)
  end
end



=begin


I see a list of locations with vending machines that carry that snack
I see the average price for snacks in those vending machines
And I see a count of the different kinds of items in that vending machine.
=end
