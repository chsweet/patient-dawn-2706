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
    @team_3 = Team.create!(hometown: 'Silverthorne, CO', nickname: 'EZ Pass')

    @player_1 = @team_1.players.create!(name: 'Elbert', age: 41)
    @player_2 = @team_1.players.create!(name: 'Hilda', age: 26)
    @player_3 = @team_2.players.create!(name: 'Nick', age: 37)
    @player_4 = @team_2.players.create!(name: 'Colleen', age: 36)
    @player_5 = @team_3.players.create!(name: 'Tim', age: 32)
    @player_6 = @team_3.players.create!(name: 'Jen', age: 36)
  end

  describe 'class methods' do
    describe 'order teams by avg age' do
      xit 'returns team orderd by avg age' do
        expect(Team.order_by_player_avg_age).to eq([@team_1, @team_3, @team_2])
      end
    end
  end
  describe 'instance methods' do
    describe '#team_player_avg_age' do
      xit 'returns the players avg age for team' do
        expect(@team_1.team_player_avg_age).to eq(33)
        expect(@team_2.team_player_avg_age).to eq(36)
      end
    end
  end
end
