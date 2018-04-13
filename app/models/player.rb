class Player < ApplicationRecord
  enum roles: [
                :villager,
                :werewolf,
                :seer,
                :twin,
              ].freeze

  def role
    Player.roles.key(self[:role])
  end
end
