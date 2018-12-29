class Game < ApplicationRecord
  has_many :players
  belongs_to :player_group
end
