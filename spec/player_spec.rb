require ("minitest/autorun")
require_relative("../player")

class TestPlayer < MiniTest::Test

  def setup
    @player=Player.new("Val")
  end

  def test_player_as_name
    assert_equal("Val",@player.name)
  end

  def test_player_starts_at_tile_0 
    assert_equal(0,@player.position)
  end  

  def test_player_can_move
    @player.move(5)
    assert_equal(5,@player.position)
  end

end