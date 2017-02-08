require './app/command_place'
require './app/robot'

class Simulator
  attr_reader :commands_executed

  def initialize(params)
    @commands = params.fetch(:commands)
    @commands_executed = []
  end

  def run
    robot = Robot.new
    @commands.strip.each_line do |line|
      command = get_command(line).new(robot: robot, params: get_params(line))
      if command.execute
        @commands_executed << command
      else
        command.unexecute
      end
    end
  end

  private

  def get_command(line)
    command_name = line.split(' ')[0]
    require "./app/command_#{command_name.downcase}"
    Object.const_get("Command#{command_name.capitalize}")
  end

  def get_params(line)
    line.split(' ')[1]
  end

end
