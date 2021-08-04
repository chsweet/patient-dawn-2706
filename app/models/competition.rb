class Competition < ApplicationRecord
  has_many :registrations
  has_many :teams, through: :registrations

  def player_avg_age
    teams.joins(:players).average("players.age").to_i
  end
end
