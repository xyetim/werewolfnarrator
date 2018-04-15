class Game < ApplicationRecord
  has_many :players, after_add: :player_added, dependent: :destroy

  enum phases:  [
                  Phase::ConnectionPhase,
                  Phase::AssignRolesPhase,
                  Phase::TwinsPhase,
                  Phase::WerewolvesPhase,
                  Phase::SeerPhase,
                  Phase::MorningRevealPhase,
                  Phase::MayorPhase,
                  Phase::LynchPhase,
                  Phase::TestPhase,
                ].freeze

  # Villagers are filled automagically
  ROLE_POOL = [
                :werewolf,
                :seer,
              ]

  def current_phase
    Game.phases.key(self[:current_phase])
  end

  def full
    players.size >= num_players
  end

  def player_added(player)
    update_players
    phase_done?
  end

  def phase_done?
    if current_phase.done?(self)
      next_phase
    end
  end

  def next_phase
    self[:current_phase] = Game.phases[current_phase.next_phase(self)]

    # clear reponses
    players.each do |player|
      player.update(response: nil)
    end

    current_phase.try(:start, self)
    save

    update_players
  end

  def update_players
    players.each do |player|
      player.update_player
    end
  end
end
