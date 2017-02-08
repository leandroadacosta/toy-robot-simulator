require './app/command'

class CommandMove < Command

  def execute
    @robot.move_forward
    rescue RobotException => e
  end

  def unexecute
    @robot.move_back
    rescue RobotException => e
  end

end
