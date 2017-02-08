require './app/command'

class CommandRight < Command

  def execute
    @robot.turn_right
    rescue RobotException => e
  end

  def unexecute
    @robot.turn_left
    rescue RobotException => e
  end

end
