class PlayerGroup < ApplicationRecord
  has_many :players, dependent: :destroy, after_add: :add_player
  has_many :games

  #validates :public_id, presence: true,  uniqueness: true
  #has_secure_token :public_id
  after_create :generate_public_id

  # def initialize(attr)

  # end

  def add_player(player)
    # do some updates and stuff
  end

  private

  def generate_public_id
    token_chars = ('A'..'Z').to_a + ('0'..'9').to_a
    self.public_id = token_chars.sample(4) + "-" + token_chars.sample(4)
  end
end
