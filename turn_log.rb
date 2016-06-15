class TurnLog
  attr_reader(:player, :modifier, :roll)
  def initialize(params)
    @player=params[:player]
    @modifier=params[:modifier]
    @roll=params[:roll]
  end

  def modifier_type
    result = :space
    result = :ladder if modifier > 0
    result = :snake if modifier < 0

    return result
  end
end