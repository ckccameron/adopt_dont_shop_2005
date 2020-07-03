require 'rails_helper'

RSpec.describe "shelter create page" do
  it "can allow user to create a new shelter" do

    visit "/shelters"
    expect(page).to have_content("All Shelters")

    click_on "New Shelter"
    expect(current_path).to eq("/shelters/new")

    fill_in :name, with: "Dumb Friends League"
    fill_in :address, with: "2080 S. Quebec St"
    fill_in :city, with: "Denver"
    fill_in :state, with: "CO"
    fill_in :zip, with: "80231"

    click_on "Create Shelter"
    expect(current_path).to eq("/shelters")

    expect(page).to have_content("Dumb Friends League")
  end
end
