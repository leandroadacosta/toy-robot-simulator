require './app/command'
require './app/robot_table'
require './app/robot_facing'

class CommandPlace < Command

  def execute
    table = RobotTable.new(x: params[0], y: params[1])
    facing = RobotFacing.new(name: params[2])
    @robot.place_on(table, facing)
    rescue RobotException => e
  end

  def unexecute
    @robot.place_off!
    rescue RobotException => e
  end

  private

  def params
    @params.split(',')
  end

end
