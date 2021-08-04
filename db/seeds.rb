# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

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
