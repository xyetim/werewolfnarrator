class Phase::Night::NightStartPhase
  class << self
    def start(game)
      game.night_count += 1

      game.update(night_targets: []) # clear for next night
      system("say 'Everybody goes to sleep.'")
      sleep 3

      # Start night sound loop
      pid = fork do
        Signal.trap("INT") { system("killall afplay"); exit}
        # loop do
        #   system("afplay #{Rails.root}/app/assets/audios/night_cut.mp3 -v 0.3")
        # end
      end

      game.update(music_pid: pid)
    end

    def done?(game)
      true
    end

    def next_phase(game)
      if game.night_count == 1
        Phase::Night::TwinsPhase
      else
        Phase::Night::SeerPhase
      end
    end
  end
end
