require './app/command'

class CommandLeft < Command

  def execute
    begin
      @robot.turn_left
      true
    rescue RobotException => e
      false
    end
  end

  def unexecute
    begin
      @robot.turn_right
      true
    rescue RobotException => e
      false
    end
  end

end