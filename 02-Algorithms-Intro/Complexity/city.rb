class City
  attr_accessor :name
  # attr_accessor :visited
  attr_accessor :x
  attr_accessor :y

  def initialize(name, x, y)
    @x    = x
    @y    = y
    @name = name
    # @visited = false
  end
end
