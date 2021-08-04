class Team < ApplicationRecord
  has_many :players
  has_many :registrations
  has_many :competitions, through: :registrations

  def self.order_by_player_avg_age
    require "pry";binding.pry
  end

  def team_player_avg_age
    players.average(:age).to_i
  end
end
