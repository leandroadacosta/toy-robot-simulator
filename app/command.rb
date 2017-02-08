class Command

  def initialize(params)
    @robot = params.fetch(:robot)
    @params = params.fetch(:params)
  end

  def execute
    raise NotImplementedError
  end

  def unexecute
    raise NotImplementedError
  end

end
