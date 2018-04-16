class Phase::WerewolvesPhase
  class << self
    def start(game)
      system("say 'The werewolves wake up, and choose their target.'")
      sleep 4
    end
  end
end
