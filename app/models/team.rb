class Team < ApplicationRecord
  has_many :players
  has_many :registrations
  has_many :competitions, through: :registrations

  def team_player_avg_age
    players.average(:age).to_i
  end
end
