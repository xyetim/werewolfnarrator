require 'test_helper'

class PlayerTest < ActiveSupport::TestCase
  describe "without name" do
    subject do
      pg = PlayerGroup.create
      g = pg.games.create
      g.players.create
    end

    it "should not be valid" do
      assert_equal 1, subject.errors.size
    end
  end
end
