class Player < ApplicationRecord
  enum roles: [
                :villager,
                :werewolf,
                :seer,
              ].freeze
end
