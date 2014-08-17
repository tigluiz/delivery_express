require 'rails_helper'
feature "Map location crud" do
  scenario "Create a new map location" do
    visit '/map_locations/new'
    fill_in 'map_location_name', :with => 'Example'
    fill_in 'map_location_road_info', :with => 'A B 10, B C 15'
    click_button 'Criar Mapa'
    expect(page).to have_content 'Seu mapa foi criado com sucesso'
  end
end

