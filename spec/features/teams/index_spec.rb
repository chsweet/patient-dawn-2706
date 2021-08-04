require 'rails_helper'

RSpec.describe 'teams index page' do
  before :each do
    @team_1 = Team.create!(hometown: 'Denver, CO', nickname: 'Notorious D.I.G.')
    @team_2 = Team.create!(hometown: 'Idaho Springs, CO', nickname: 'Bumpin Uglies')
    @team_3 = Team.create!(hometown: 'Silverthorne, CO', nickname: 'EZ Pass')

    @player_1 = @team_1.players.create!(name: 'Elbert', age: 41)
    @player_2 = @team_1.players.create!(name: 'Hilda', age: 26)
    @player_3 = @team_2.players.create!(name: 'Nick', age: 37)
    @player_4 = @team_2.players.create!(name: 'Colleen', age: 36)
    @player_5 = @team_3.players.create!(name: 'Tim', age: 32)
    @player_6 = @team_3.players.create!(name: 'Jen', age: 36)
  end
  it 'displays all teams nicknames' do
    visit teams_path

    expect(page).to have_content(@team_1.nickname)
    expect(page).to have_content(@team_2.nickname)
    expect(page).to have_content(@team_3.nickname)
  end

  it 'displays the average age of the team' do
    visit teams_path

    within("#team-#{@team_1.id}") do
      expect(page).to have_content(@team_1.nickname)
      expect(page).to have_content("Team Average Age: 33")
    end
  end

  xit 'orders teams by average age youngest to oldest' do
    visit teams_path

    expect(@team_1).to appear_before(@team_3)
    expect(@team_2).to_not appear_before(@team_3)
    expect(@team_3).to appear_before(@team_2)
  end
end
