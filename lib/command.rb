class Command
  attr_reader  :action, :direction, :x_position, :y_position
  COMMANDS = %w(PLACE MOVE LEFT RIGHT REPORT)
  DIRECTIONS = %w(NORTH SOUTH EAST WEST)

  class << self
    def valid_command?( command )
      COMMANDS.include?(command)
    end

    def valid_direction?(direction)
      DIRECTIONS.include?(direction)
    end

    def parse( line )
      Command.new(line)
    end
  end

  def valid?
    @valid
  end

  private

  def int?( val )
    val =~ /[0-4]/
  end

  def place_command_valid?( val )
    if @action == 'PLACE'
      arguments = val.split(',')

      if arguments.size == 3
        if int?(arguments[0]) && int?(arguments[1]) && Command.valid_direction?(arguments[2])
          @x_position = arguments[0].to_i
          @y_position = arguments[1].to_i
          @direction = arguments[2]
          return true
        end
      end
    end

    return false
  end

  def initialize( line )
    @valid = false
    begin
      parts = line.strip.split(' ')
      return if parts.empty?

      if Command.valid_command?( parts[0] )
        @action = parts[0]
        if parts.size > 1
          @valid = place_command_valid?(parts[1])
        else
          @valid = true
        end
      end
    rescue Exception

    end
  end

end
