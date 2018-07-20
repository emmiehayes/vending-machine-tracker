require 'rails_helper'

feature 'When a user visits a vending machine show page' do
  scenario 'they see the location of that machine' do
    owner = Owner.create(name: "Sam's Snacks")
    dons  = owner.machines.create(location: "Don's Mixed Drinks")

    visit machine_path(dons)

    expect(page).to have_content("Don's Mixed Drinks Vending Machine")
  end

  scenario 'they see the name and price for all of the snacks in the machine' do
    owner = Owner.create(name: "Sam's Snacks")
    dons  = owner.machines.create(location: "Don's Mixed Drinks")
    sprite = dons.items.create(name: 'Sprite', price: 1)
    coke = dons.items.create(name: 'CocaCola', price: 3)

    visit machine_path(dons)

    expect(page).to have_content("Don's Mixed Drinks Vending Machine")
    expect(page).to have_content("CocaCola")
    expect(page).to have_content("$3")
    expect(page).to have_content("Sprite")
    expect(page).to have_content("$1")
  end

  xscenario 'they see avg price for all items in the machine' do
    owner = Owner.create(name: "Sam's Snacks")
    dons  = owner.machines.create(location: "Don's Mixed Drinks")

    visit machine_path(dons)

    expect(page).to have_content("Don's Mixed Drinks Vending Machine")
  end
end
