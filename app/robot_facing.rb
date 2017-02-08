class RobotFacing
  ENUM = ['NORTH', 'EAST', 'SOUTH', 'WEST']

  def initialize(params)
    @index = ENUM.index(params.fetch(:name))
  end

  def rotate_left
    @index -= 1
    if @index < 0
      @index = ENUM.index(ENUM.last)
    end
  end

  def rotate_right
    @index += 1
    if @index > ENUM.size-1
      @index = ENUM.index(ENUM.first)
    end
  end

  def move_one_unit_forward_of(place)
    case self.name
    when 'NORTH'
      place.sum_y(1)
    when 'EAST'
      place.sum_x(1)
    when 'SOUTH'
      place.sum_y(-1)
    when 'WEST'
      place.sum_x(-1)
    end
  end

  def move_one_unit_back_of(place)
    case self.name
    when 'NORTH'
      place.sum_y(-1)
    when 'EAST'
      place.sum_x(-1)
    when 'SOUTH'
      place.sum_y(1)
    when 'WEST'
      place.sum_x(1)
    end
  end

  def name
    ENUM[@index]
  end

end
