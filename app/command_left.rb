require './app/command'

class CommandLeft < Command

  def execute
    @robot.turn_left
    rescue RobotException => e
  end

  def unexecute
    @robot.turn_right
    rescue RobotException => e
  end

end
