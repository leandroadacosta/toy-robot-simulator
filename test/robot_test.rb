require 'minitest/autorun'
require './app/robot'
require './app/robot_table'
require './app/robot_facing'

describe Robot do

  describe "#place_on" do
    it "should put the toy robot on the table in position X, Y and
        facing NORTH, SOUTH, EAST or WEST" do
      robot = Robot.new
      table = RobotTable.new(x: 1, y: 3)
      facing = RobotFacing.new(name: 'SOUTH')
      robot.place_on(table, facing)

      assert_equal 1, robot.location[:place][:x]
      assert_equal 3, robot.location[:place][:y]
      assert_equal 'SOUTH', robot.location[:facing]
    end
  end

  describe "#move_forward" do
    it "should move the toy robot one unit forward in the direction
        it is currently facing" do
      robot = Robot.new
      table = RobotTable.new(x: 1, y: 3)
      facing = RobotFacing.new(name: 'SOUTH')
      robot.place_on(table, facing)

      assert_equal 1, robot.location[:place][:x]
      assert_equal 3, robot.location[:place][:y]
      robot.move_forward
      assert_equal 1, robot.location[:place][:x]
      assert_equal 2, robot.location[:place][:y]
    end
  end

  describe "#move_back" do
    it "should move the toy robot one unit back in the direction
        it is currently facing" do
      robot = Robot.new
      table = RobotTable.new(x: 1, y: 3)
      facing = RobotFacing.new(name: 'SOUTH')
      robot.place_on(table, facing)

      assert_equal 1, robot.location[:place][:x]
      assert_equal 3, robot.location[:place][:y]
      robot.move_back
      assert_equal 1, robot.location[:place][:x]
      assert_equal 4, robot.location[:place][:y]
    end
  end

  describe "#turn_left" do
    it "should rotate the robot 90 degrees in the left direction without
        changing the position of the robot" do
      robot = Robot.new
      table = RobotTable.new(x: 5, y: 5)
      facing = RobotFacing.new(name: 'NORTH')
      robot.place_on(table, facing)

      assert_equal 5, robot.location[:place][:x]
      assert_equal 5, robot.location[:place][:y]
      assert_equal 'NORTH', robot.location[:facing]
      robot.turn_left
      assert_equal 5, robot.location[:place][:x]
      assert_equal 5, robot.location[:place][:y]
      assert_equal 'WEST', robot.location[:facing]
    end
  end

  describe "#turn_right" do
    it "should rotate the robot 90 degrees in the right direction without
        changing the position of the robot" do
      robot = Robot.new
      table = RobotTable.new(x: 5, y: 5)
      facing = RobotFacing.new(name: 'WEST')
      robot.place_on(table, facing)

      assert_equal 5, robot.location[:place][:x]
      assert_equal 5, robot.location[:place][:y]
      assert_equal 'WEST', robot.location[:facing]
      robot.turn_right
      assert_equal 5, robot.location[:place][:x]
      assert_equal 5, robot.location[:place][:y]
      assert_equal 'NORTH', robot.location[:facing]
    end
  end

  describe "#location" do
    it "should announce the x, y and facing of the robot" do
      robot = Robot.new
      table = RobotTable.new(x: 5, y: 5)
      facing = RobotFacing.new(name: 'WEST')
      robot.place_on(table, facing)

      assert_instance_of Hash, robot.location
      assert_equal 5, robot.location[:place][:x]
      assert_equal 5, robot.location[:place][:y]
      assert_equal 'WEST', robot.location[:facing]
    end
  end

  describe "preventing wrong attributes" do
    it "should prevent the robot does some action without place" do
      robot = Robot.new
      facing = RobotFacing.new(name: 'NORTH')

      lambda { robot.place_on(nil, facing) }.must_raise RobotException
      assert robot.place_off!
      lambda { robot.move_forward }.must_raise RobotException
      lambda { robot.move_back }.must_raise RobotException
      lambda { robot.turn_left }.must_raise RobotException
      lambda { robot.turn_right }.must_raise RobotException
      lambda { robot.location }.must_raise RobotException
    end

    it "should prevent the robot does some action without facing" do
      robot = Robot.new
      table = RobotTable.new(x: 6, y: 5)

      lambda { robot.place_on(table, nil) }.must_raise RobotException
      assert robot.place_off!
      lambda { robot.move_forward }.must_raise RobotException
      lambda { robot.move_back }.must_raise RobotException
      lambda { robot.turn_left }.must_raise RobotException
      lambda { robot.turn_right }.must_raise RobotException
      lambda { robot.location }.must_raise RobotException
    end
  end

  describe "checking validations" do
    it "should raise an expcetion when the robot is not on the table for the
        MOVE, LEFT, RIGHT and REPORT commands" do
      robot = Robot.new
      table = RobotTable.new(x: 6, y: 5)
      facing = RobotFacing.new(name: 'NORTH')

      assert robot.place_off!
      lambda { robot.place_on(table, facing) }.must_raise RobotException
      lambda { robot.move_forward }.must_raise RobotException
      lambda { robot.move_back }.must_raise RobotException
      lambda { robot.turn_left }.must_raise RobotException
      lambda { robot.turn_right }.must_raise RobotException
      assert_instance_of Hash, robot.location
    end
  end

end
