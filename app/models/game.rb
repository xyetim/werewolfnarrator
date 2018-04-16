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

  serialize :roles, Array

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
    # TODO set players view to _defaul_night so they dont get stuck and no one can peak if slow

    current_phase.try(:end, self)

    # find first phase that is not skipped
    loop do
      self[:current_phase] = Game.phases[current_phase.next_phase(self)]

      skip = current_phase.try(:skip?, self)
      break if skip == nil ? true : !skip
    end
    save

    current_phase.try(:before_start, self)

    # clear reponses
    players.each do |player|
      player.update(response: nil)
    end

    update_players

    current_phase.try(:start, self)
  end

  def update_players
    players.each do |player|
      player.update_player
    end
  end
end
