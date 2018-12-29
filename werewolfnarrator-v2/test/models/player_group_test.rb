require 'test_helper'

class PlayerGroupTest < ActiveSupport::TestCase
  describe "add players" do
    subject do
      pg = PlayerGroup.create
      pg.players.create(name: "Frank")
      pg.players.create(name: "William")
      pg
    end

    it "should have player(s)" do
      assert_equal ["Frank", "William"], subject.players.map(&:name)
    end
  end
end
