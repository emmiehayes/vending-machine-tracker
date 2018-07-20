require 'rails_helper'

feature 'When a user visits an item show page' do
  scenario 'they see the name,price,for the snack' do
    owner = Owner.create(name: "Sam's Snacks")
    dons  = owner.machines.create(location: "Don's Mixed Drinks")
    sprite = dons.items.create(name: 'Sprite', price: 1)

    visit item_path(sprite)

    expect(page).to have_content("Sprite")
    expect(page).to have_content('$1')
  end

  scenario 'they see a list of machine locations that carry the snack' do
    owner = Owner.create(name: "Sam's Snacks")
    dons  = owner.machines.create(location: "Don's Mixed Drinks")
    teds  = owner.machines.create(location: "Ted's Mixed Drinks")
    sprite = teds.items.create(name: 'Sprite', price: 1)
    sprite = dons.items.create(name: 'Sprite', price: 2)

    visit item_path(sprite)

    expect(page).to have_content(dons.location)
    expect(page).to have_content(teds.location)
  end

  scenario 'they see average price for snacks in vending machines at locations' do
    owner = Owner.create(name: "Sam's Snacks")
    dons  = owner.machines.create(location: "Don's Mixed Drinks")
    teds  = owner.machines.create(location: "Ted's Mixed Drinks")
    sprite = teds.items.create(name: 'Sprite', price: 1)
    sprite = dons.items.create(name: 'Sprite', price: 2)
    coke = teds.items.create(name: 'CocaCola', price: 3)
    mountain_dew = dons.items.create(name: 'Mountain Dew', price: 2)

    visit item_path(sprite)

    expect(page).to have_content(dons.average_price)
    expect(page).to have_content(teds.average_price)
  end

  scenario 'they count for different types of items in that vending machine' do
    owner = Owner.create(name: "Sam's Snacks")
    dons  = owner.machines.create(location: "Don's Mixed Drinks")
    teds  = owner.machines.create(location: "Ted's Mixed Drinks")
    sprite = teds.items.create(name: 'Sprite', price: 1)
    sprite = dons.items.create(name: 'Sprite', price: 2)
    coke = teds.items.create(name: 'CocaCola', price: 3)
    mountain_dew = dons.items.create(name: 'Mountain Dew', price: 2)

    visit item_path(sprite)

    expect(page).to have_content(dons.item_total)
    expect(page).to have_content(teds.item_total)
  end
end
