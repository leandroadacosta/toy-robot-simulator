class RobotTable
  DIMENSIONS = {width: 5, height: 5}

  def initialize(params)
    @x = params.fetch(:x).to_i
    @y = params.fetch(:y).to_i
  end

  def sum_x(number)
    @x += number
  end

  def sum_y(number)
    @y += number
  end

  def valid?
    @x.between?(0,DIMENSIONS[:width]) && @y.between?(0,DIMENSIONS[:height])
  end

  def coordinates
    {x: @x, y: @y}
  end

end
