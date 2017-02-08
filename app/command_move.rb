require './app/command'

class CommandMove < Command

  def execute
    begin
      @robot.move_forward
      true
    rescue RobotException => e
      false
    end
  end

  def unexecute
    begin
      @robot.move_back
      true
    rescue RobotException => e
      false
    end
  end

end
