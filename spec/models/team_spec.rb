require 'rails_helper'

RSpec.describe Team do
  describe 'relationships' do
    it { should have_many(:players) }
    it { should have_many(:registrations) }
    it { should have_many(:competitions).through(:registrations) }
  end
  before :each do
    @team_1 = Team.create!(hometown: 'Denver, CO', nickname: 'Notorious D.I.G.')
    @team_2 = Team.create!(hometown: 'Idaho Springs, CO', nickname: 'Bumpin Uglies')

    @player_1 = @team_1.players.create!(name: 'Elbert', age: 41)
    @player_2 = @team_1.players.create!(name: 'Hilda', age: 26)
    @player_3 = @team_2.players.create!(name: 'Nick', age: 37)
    @player_4 = @team_2.players.create!(name: 'Colleen', age: 36)
  end
  describe 'instance methods' do
    describe '#team_player_avg_age' do
      it 'returns the players avg age for team' do
        expect(@team_1.team_player_avg_age).to eq(33)
        expect(@team_2.team_player_avg_age).to eq(36)
      end
    end
  end
end
