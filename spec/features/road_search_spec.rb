require 'rails_helper'
describe "Search for road info" do
  before :each do
    @map_location = MapLocation.create(name: "example", road_info: "A B 10, B C 15" )
  end
  scenario "When all informations are correct" do
    visit '/roads'
    click_link(@map_location.id)
    expect(page).to have_content @map_location.name
    fill_in "origin", with: "A"
    fill_in "destiny", with: "B"
    fill_in "autonomy", with: "10"
    fill_in "gas_value", with: "2.5"
    click_button 'Enviar'
    expect(page).to have_content 'Caminho'
    expect(page).to have_content 'AB'
    expect(page).to have_content 'Custo'
    expect(page).to have_content '2.5'
  end
end
