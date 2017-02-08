require './app/robot_exception'

class Robot

  def place_on(place, facing)
    @place = place
    @facing = facing
    check_attributes
    check_validations
  end

  def place_off!
    @place = nil
    @facing = nil
  end

  def move_forward
    check_attributes
    @facing.move_one_unit_forward_of(@place)
    check_validations
  end

  def move_back
    check_attributes
    @facing.move_one_unit_back_of(@place)
    check_validations
  end

  def turn_left
    check_attributes
    @facing.rotate_left
    check_validations
  end

  def turn_right
    check_attributes
    @facing.rotate_right
    check_validations
  end

  def location
    check_attributes
    {place: @place.coordinates, facing: @facing.name}
  end

  private

  def check_attributes
    if @place.nil? || @facing.nil?
      raise RobotException.new("Robot has not been placed or faced.")
    end
  end

  def check_validations
    if !@place.valid?
      raise RobotException.new("Robot is not being on the place.")
    end
  end

end
