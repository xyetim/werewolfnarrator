require 'test_helper'

class GameTest < ActiveSupport::TestCase
  subject do
    pg = PlayerGroup.create
    g = pg.games.create
    g.players.create(name: "Frank")
    g.players.create(name: "Albert")
    g
  end

  it "should have correct number of players" do
    assert_equal 2, subject.players.size
  end
end
