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
  it 'displays competition name, location, and sport' do
    visit competition_path(@competition_1)

    expect(page).to have_content(@competition_1.name)
    expect(page).to have_content(@competition_1.location)
    expect(page).to have_content(@competition_1.sport)
  end
  it 'displays the nickname and hometown of all teams registered' do
    visit competition_path(@competition_1)

    within ("#team-#{@team_1.id}") do
      expect(page).to have_content(@team_1.nickname)
      expect(page).to have_content(@team_1.hometown)
    end

    within ("#team-#{@team_2.id}") do
      expect(page).to have_content(@team_2.nickname)
      expect(page).to have_content(@team_2.hometown)
    end
  end
  it 'displays the average age of all players in the competition' do
    visit competition_path(@competition_1)

    expect(page).to have_content('Competition Average Player Age: 34')
  end
end
