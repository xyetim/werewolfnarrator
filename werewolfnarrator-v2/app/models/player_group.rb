class PlayerGroup < ApplicationRecord
  has_many :players, dependent: :destroy, after_add: :add_player
  has_many :games
  #validates :public_id, presence: true,  uniqueness: true
  has_secure_token :public_id

  def initialize(attr)
    # token here
    binding.pry
  end

  def add_player(player)
    # do some updates and stuff
  end
end
