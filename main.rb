require './app/simulator'

commands = File.read("commands.txt")
Simulator.new(commands: commands).run
