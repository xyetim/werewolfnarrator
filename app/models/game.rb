class Game < ApplicationRecord
  has_many :players, after_add: :player_added, dependent: :destroy

  enum phases:  [
                  Phase::Prep::ConnectionPhase,
                  Phase::Prep::AssignRolesPhase,
                  Phase::Night::NightStartPhase,
                  Phase::Night::TwinsPhase,
                  Phase::Night::WerewolvesPhase,
                  Phase::Night::SeerPhase,
                  Phase::Day::DayStartPhase,
                  Phase::Day::MayorPhase,
                  Phase::Day::LynchPhase,
                ].freeze

  serialize :roles, Array
  serialize :night_targets, Array

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
      true
    else
      false
    end
  end

  def won_by
    if full && !players.where(role: [:werewolf, nil], alive: true).any? # doesnt not work!!
      "villagers"
    elsif players.where(alive: true).all?{|pl| pl.role == :werewolf} # might not work
      "werewolves"
    end
  end

  def next_phase
    if won_by
      update_players
      return
    end

    update(in_phase_transition: true)
    update_players
    current_phase.try(:end, self)

    new_phase = find_next_phase

    update(current_phase: Game.phases[new_phase])

    current_phase.try(:before_start, self)

    update(in_phase_transition: false)

    # clear reponses
    players.each do |player|
      player.update(response: nil)
    end

    update_players

    current_phase.try(:start, self)
    phase_done?
  end

  def find_next_phase
    new_phase = current_phase
    loop do
      new_phase = new_phase.next_phase(self)

      skip = new_phase.try(:skip?, self)
      break if skip == nil ? true : !skip
    end
    new_phase
  end

  def update_players
    players.each do |player|
      player.update_player
    end
  end

  def werewolf_leader
    players.werewolf.select{ |player| player.is_werewolf_leader}.first
  end

  def game_guide
    players.select{|player| player.is_game_guide}.first
  end
end
