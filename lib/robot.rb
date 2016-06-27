class Robot
  attr_reader :x_position, :y_position

  DIRECTIONS = {'NORTH' => 0, 'EAST' => 1, 'SOUTH' => 2, 'WEST' => 3}

  def initialize(x, y, direction )
    @x_position = x
    @y_position = y
    @direction = DIRECTIONS[direction]
  end

  def move
    if @direction % 2 == 0
      prospect = prospect_move(@y_position)
      @y_position = prospect >=0 && prospect < 5 ? prospect : @y_position
    else
      prospect = prospect_move(@x_position)
      @x_position = prospect >=0 && prospect < 5 ? prospect : @x_position
    end
  end

  def left
    @direction -= 1
    @direction %= 4
  end

  def right
    @direction += 1
    @direction %= 4
  end

  def report
    puts "#{direction} (x,y) (#{@x_position}, #{@y_position})"
  end



  def direction
    DIRECTIONS.each do |k,v|
      return k if v == @direction
    end
  end

  private

  def prospect_move( pos )
    val = if @direction < 2
      1
    else
      -1
    end
    pos += val
  end

end
