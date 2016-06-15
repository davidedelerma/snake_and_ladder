class Board
  def initialize(size, positions)
    @state=Array.new(size,0)
    set_up_positions(positions)
  end

  def nb_of_tiles
    return @state.length
  end

  def set_up_positions(positions)
    for key in positions.keys
      @state[key]=positions[key]
    end
  end
  
  def modifier_at_position(position)
    return @state[position]
  end

  def win_tile
    return @state.size - 1
  end

  def lose_tile
    return 5
  end
end