#!/usr/bin/env ruby -w

$LOAD_PATH.unshift(File.dirname(__FILE__))
require 'lib/app'
robot = nil

ARGF.each do |line|
  cmd = Command.parse(line)
  if cmd.valid?
    if cmd.action == 'PLACE'
      robot = Robot.new( cmd.x_position, cmd.y_position, cmd.direction)
    else
      if robot
        robot.send(cmd.action.downcase)
      end
    end
  end

end
