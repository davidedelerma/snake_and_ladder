require_relative 'game'
require_relative 'player'
require_relative 'board'
require_relative 'dice'
require_relative 'viewer'

class SnakeAndLadders

  def initialize(dice, viewer)
    @dice = dice
    @viewer = viewer

    positions = {
      2 => 4,
      7 => -7,
      10 => 4,
      26=>3,
      30=>-4,
      20=>-10
    }

    board = Board.new(36, positions)

    player_1_name = @viewer.get_player_name(1)
    player_2_name = @viewer.get_player_name(2)

    player1 = Player.new(player_1_name)
    player2 = Player.new(player_2_name)

    players = [player1,player2]
    @game = Game.new(players,board)
  end

  def run()
    while(!(@game.is_won? || @game.is_lost?))
      @viewer.start(@game.current_player.name)
      @game.next_turn(@dice.roll)
      @viewer.show_update(@game.log.last)
    end
#add if winner.size >0 then winner elsif loser
    if @game.is_won?
      @viewer.end(@game.winner.name)
    elsif @game.is_lost?
      @viewer.endlose(@game.loser.name)
    end 
  end

end

game = SnakeAndLadders.new(Dice.new, Viewer.new)
game.run()
