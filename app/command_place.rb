require './app/command'
require './app/robot_table'
require './app/robot_facing'

class CommandPlace < Command

  def execute
    begin
      table = RobotTable.new(x: params[0], y: params[1])
      facing = RobotFacing.new(name: params[2])
      @robot.place_on(table, facing)
      true
    rescue RobotException => e
      false
    end
  end

  def unexecute
    begin
      @robot.place_off!
      true
    rescue RobotException => e
      false
    end
  end

  private

  def params
    @params.split(',')
  end

end
