class Player < ApplicationRecord
  belongs_to :game, optional: true
  validates :name, presence: true

  # Roles as enum field (as it was)
  # Roles as models
  #  that inherit from Player
  #  that inherit from Role
  # What todo with Mayor and Game Master.
  # Since it you can be all three at the same time
end
