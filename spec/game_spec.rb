require ("minitest/autorun")
require_relative("../player")
require_relative("../board")
require_relative("../game")

class TestGame < MiniTest::Test

  def setup
    positions={
      2=>4,
      7=>-7,
    }
    @board=Board.new(9, positions)

    @player1=Player.new("Val")
    @player2=Player.new("Rick")
  
    @players =[@player1,@player2]

    @game=Game.new(@players,@board)
  end

  def test_game_starts_with_2_players
    assert_equal(2,@game.number_of_players())
  end

  def test_game_current_player_starts_as_player_1
    assert_equal(@player1,@game.current_player())
  end

  def test_update_current_player
    assert_equal(@player2,@game.update_current_player())
  end  

  def test_can_take_turn
    @game.next_turn(1)
    assert_equal(1,@player1.position)
    assert_equal(@player2,@game.current_player)
  end

  def test_cannot_move_beyond_end_of_board
    @game.next_turn(15)
    assert_equal(8,@player1.position)
  end

  def test_can_take_turn_with_ladder
    @game.next_turn(2)
    assert_equal(6,@player1.position)
  end

  def test_can_take_turn_with_snake
    @game.next_turn(7)
    assert_equal(0,@player1.position)
  end  

  def test_winner_starts_as_nil
    assert_equal(nil,@game.winner)
  end

  def test_game_is_won
    @game.next_turn(8)
    assert_equal(true,@game.is_won?)
  end

  def test_game_is_lost
    @game.next_turn(5)
    assert_equal(true,@game.is_lost?)
  end

  def test_no_next_turn_on_win
    @game.next_turn(8)
    @game.next_turn(2)
    assert_equal(0,@player2.position)
  end

  def test_adds_turn_to_log
    @game.next_turn(1)
    assert_equal(1,@game.log.size)
    assert_equal("Val", @game.log[0].player.name)
    assert_equal(1,@game.log[0].roll)
    assert_equal(0,@game.log[0].modifier)
  end

end









