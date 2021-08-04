class Team < ApplicationRecord
  has_many :players
  has_many :registrations
  has_many :competitions, through: :registrations
end
