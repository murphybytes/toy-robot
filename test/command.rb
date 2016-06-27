
class CommandTest < Test::Unit::TestCase
  def test_valid_commands
    assert Command.valid_command?('PLACE')
    assert Command.valid_command?('MOVE')
    assert Command.valid_command?('LEFT')
    assert Command.valid_command?('RIGHT')
    assert Command.valid_command?('REPORT')
    assert !Command.valid_command?('ZIPPER')
  end

  def test_valid_directions
    assert Command.valid_direction?('NORTH')
    assert Command.valid_direction?('SOUTH')
    assert Command.valid_direction?('EAST')
    assert Command.valid_direction?('WEST')
    assert !Command.valid_direction?('FOO')
  end

  def test_parse
    assert Command.parse('MOVE').valid?
    assert Command.parse('MOVE').action == 'MOVE'
    assert !Command.parse('MOVIE').valid?

    assert Command.parse('PLACE 1,2,EAST').valid?
    assert !Command.parse('MOVE 1,2,EAST').valid?
    assert !Command.parse('PLACE 1,X,EAST').valid?
    assert !Command.parse('PLACE 1,2,4,EAST').valid?
    assert !Command.parse('PLACE 1,2,PLACE').valid?
    assert !Command.parse('PLACE 1,6,EAST').valid?
    cmd = Command.parse('PLACE 1,2,EAST')
    assert cmd.x_position == 1
    assert cmd.y_position == 2
    assert cmd.direction == 'EAST'
    assert cmd.action == 'PLACE'


  end
end
