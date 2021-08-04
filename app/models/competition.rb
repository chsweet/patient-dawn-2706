class Competition < ApplicationRecord
  has_many :registrations
  has_many :teams, through: :registrations
end
