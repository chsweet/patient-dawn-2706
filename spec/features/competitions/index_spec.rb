require 'rails_helper'

RSpec.describe 'competitions index page' do
  before :each do
    @competition_1 = Competition.create!(name: 'Snowmass Doubles', location: 'Aspen, CO', sport: 'volleyball')
    @competition_2 = Competition.create!(name: 'Breckenridge Doubles', location: 'Breckenridge, CO', sport: 'volleyball')
    @competition_3 = Competition.create!(name: 'Oasis Classic Doubles', location: 'Westminster, CO', sport: 'volleyball')
    @competition_4 = Competition.create!(name: 'Fraser Valley Doubles', location: 'Fraser, CO', sport: 'volleyball')
    @competition_5 = Competition.create!(name: 'Steamboat Doubles', location: 'Steamboat, CO', sport: 'volleyball')
  end
  #user story 1
  it 'displays the names of all competitions' do
    visit competitions_path

    expect(page).to have_content(@competition_1.name)
    expect(page).to have_content(@competition_2.name)
    expect(page).to have_content(@competition_3.name)
    expect(page).to have_content(@competition_4.name)
    expect(page).to have_content(@competition_5.name)
  end
  it 'displays competition name as link to show page' do
    visit competitions_path

    click_link 'Snowmass Doubles'

    expect(current_path).to eq(competition_path(@competition_1))
  end
end
