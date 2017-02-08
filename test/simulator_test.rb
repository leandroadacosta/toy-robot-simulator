require 'minitest/autorun'
require './app/simulator'

describe Simulator do

  describe "#run" do
    describe "examples of input and output" do
      it "should output: 0,1,NORTH" do
        simulator = Simulator.new(
          commands: %{
            PLACE 0,0,NORTH
            MOVE
            REPORT
          }
        )
        simulator.run

        report = simulator.commands_executed.last
        assert_equal '0,1,NORTH', report.output
      end

      it "should output: 0,1,NORTH" do
        simulator = Simulator.new(
          commands: %{
            PLACE 0,0,NORTH
            LEFT
            REPORT
          }
        )
        simulator.run

        report = simulator.commands_executed.last
        assert_equal '0,0,WEST', report.output
      end

      it "should output: 0,1,NORTH" do
        simulator = Simulator.new(
          commands: %{
            PLACE 1,2,EAST
            MOVE
            MOVE
            LEFT
            MOVE
            REPORT
          }
        )
        simulator.run

        report = simulator.commands_executed.last
        assert_equal '3,3,NORTH', report.output
      end
    end

    describe "validations" do
      it "should discard all commands in the sequence until a valid
          PLACE command has been executed" do
        simulator = Simulator.new(
          commands: %{
            MOVE
            REPORT
            PLACE 0,3,NORTH
            MOVE
            MOVE
            PLACE 0,3,NORTH
            MOVE
          }
        )
        simulator.run

        assert_equal 5, simulator.commands_executed.size
      end

      it "should ignore all commands if a robot hasn't been placed" do
        simulator = Simulator.new(
          commands: %{
            MOVE
            RIGHT
            MOVE
            RIGHT
            MOVE
            REPORT
          }
        )
        simulator.run

        assert_equal 0, simulator.commands_executed.size
      end

      it "must be prevented from falling to destruction,
          however further valid movement commands must still be allowed" do
        simulator = Simulator.new(
          commands: %{
            REPORT
            PLACE 0,3,NORTH
            MOVE
            LEFT
            RIGHT
            MOVE
            LEFT
            RIGHT
            MOVE
            MOVE
            RIGHT
            MOVE
            REPORT
          }
        )
        simulator.run

        report = simulator.commands_executed.last
        assert_equal '1,5,EAST', report.output
        assert_equal 10, simulator.commands_executed.size
      end
    end
  end

end
