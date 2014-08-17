require 'rails_helper'
feature "Map location crud" do

  scenario "Create a new map location" do
    visit '/map_locations/new'
    fill_in 'map_location_name', :with => 'Example'
    fill_in 'map_location_road_info', :with => 'A B 10, B C 15'
    click_button 'Criar Mapa'
    expect(page).to have_content 'Seu mapa foi criado com sucesso'
  end

  # given(:other_user) { User.make(:email => 'other@example.com', :password => 'rous') }

  # scenario "Signing in as another user" do
  #   visit '/sessions/new'
  #   within("#session") do
  #     fill_in 'Email', :with => other_user.email
  #     fill_in 'Password', :with => other_user.password
  #   end
  #   click_button 'Sign in'
  #   expect(page).to have_content 'Invalid email or password'
  # end
end

