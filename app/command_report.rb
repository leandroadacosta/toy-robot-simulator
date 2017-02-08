require './app/command'

class CommandReport < Command

  def execute
    begin
      puts output
      true
    rescue RobotException => e
      false
    end
  end

  def unexecute
    puts "Report was ignored."
    true
  end

  def output
    "#{@robot.location[:place][:x]},#{@robot.location[:place][:y]},#{@robot.location[:facing]}"
  end

end
