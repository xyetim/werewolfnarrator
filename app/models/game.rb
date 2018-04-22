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
    # set to nil and update players for in between phase
    old_phase = current_phase
    self[:current_phase] = nil
    save
    update_players

    old_phase.try(:end, self)

    # find first phase that is not skipped
    new_phase = old_phase
    loop do
      new_phase = Game.phases[new_phase.next_phase(self)]

      skip = new_phase.try(:skip?, self)
      break if skip == nil ? true : !skip
    end
    self[:current_phase] = new_phase
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
