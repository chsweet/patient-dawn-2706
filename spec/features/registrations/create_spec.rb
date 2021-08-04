require 'rails_helper'

RSpec.describe 'competition show page' do
  before :each do
    @competition_1 = Competition.create!(name: 'Snowmass Doubles', location: 'Aspen, CO', sport: 'volleyball')

    @team_1 = Team.create!(hometown: 'Denver, CO', nickname: 'Notorious D.I.G.')
    @team_2 = Team.create!(hometown: 'Idaho Springs, CO', nickname: 'Bumpin Uglies')
    @team_3 = Team.create!(hometown: 'Silverthorne, CO', nickname: 'EZ Pass')

    @player_1 = @team_1.players.create!(name: 'Elbert', age: 41)
    @player_2 = @team_1.players.create!(name: 'Hilda', age: 26)
    @player_3 = @team_2.players.create!(name: 'Nick', age: 37)
    @player_4 = @team_2.players.create!(name: 'Colleen', age: 36)
    @player_5 = @team_3.players.create!(name: 'Tim', age: 32)
    @player_6 = @team_3.players.create!(name: 'Jen', age: 36)

    Registration.create(team: @team_1, competition: @competition_1)
    Registration.create(team: @team_2, competition: @competition_1)
    Registration.create(team: @team_3, competition: @competition_1)
  end
  it 'competition show page has link to register new team' do
    visit competition_path(@competition_1)

    click_link 'Register New Team'

    expect(current_path).to eq("/competitions/#{@competition_1.id}/registration")
  end
  it 'displays form to fill out new teams hometown and nickname' do
    visit "/competitions/#{@competition_1.id}/registration"

    fill_in 'Nickname', with: 'Spiked Punch'
    fill_in 'Hometown', with: 'Denver, CO'
    click_button 'Register'

    expect(current_path).to eq(competition_path(@competition_1))
  end
  it 'displays new team on competition show page' do
    visit "/competitions/#{@competition_1.id}/registration"

    fill_in 'Nickname', with: 'Spiked Punch'
    fill_in 'Hometown', with: 'Denver, CO'
    click_button 'Register'

    expect(current_path).to eq(competition_path(@competition_1))
    expect(page).to have_content('Spiked Punch')
  end
end
