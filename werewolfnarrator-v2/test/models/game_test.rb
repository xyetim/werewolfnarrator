require 'test_helper'

class GameTest < ActiveSupport::TestCase
  subject do
    x = Game.create
    x.players.create(name: "Frank")
    x.players.create(name: "Albert")
    x
  end

  it "should have correct number of players" do
    assert_equal 2, subject.players.size
  end
end
