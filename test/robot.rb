class RobotTest < Test::Unit::TestCase

  def test_direction
    robot = Robot.new(0,0,'NORTH')
    robot.left
    assert robot.direction == 'WEST'
    robot.left
    assert robot.direction == 'SOUTH'
    robot.left
    assert robot.direction == 'EAST'
    robot.left
    assert robot.direction == 'NORTH'
    robot.right
    assert robot.direction == 'EAST'
    robot.right
    assert robot.direction == 'SOUTH'
    robot.right
    assert robot.direction == 'WEST'
    robot.right
    assert robot.direction == 'NORTH'
    robot.right
    assert robot.direction == 'EAST'

  end

  def test_move
    robot = Robot.new(0,0,'NORTH')
    robot.move
    assert robot.y_position == 1
    robot = Robot.new(0,4,'NORTH')
    robot.move
    assert robot.y_position == 4
    robot.left
    robot.move
    assert robot.x_position == 0
    assert robot.y_position == 4
    robot.right
    robot.right
    robot.move
    assert robot.x_position == 1
    assert robot.y_position == 4
    robot.right
    robot.move
    assert robot.x_position == 1
    assert robot.y_position == 3
    robot = Robot.new(4,4,'SOUTH')
    robot.move
    assert robot.y_position == 3
    assert robot.x_position == 4
    robot = Robot.new(2,2,'NORTH')
    robot.move
    assert robot.y_position == 3
    assert robot.x_position == 2
    robot.right # east
    robot.move
    assert robot.x_position == 3
    assert robot.y_position == 3
    robot.right # south
    robot.move
    assert robot.x_position == 3
    assert robot.y_position == 2
    robot.right # west
    robot.move
    assert robot.x_position == 2
    assert robot.y_position == 2
    robot.left # south
    robot.move
    assert robot.x_position == 2
    assert robot.y_position == 1
    robot.left # east
    robot.move
    assert robot.x_position == 3
    assert robot.y_position == 1


  end
end
