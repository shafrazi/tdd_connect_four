class Cell
  attr_accessor :value, :owner, :x, :y

  def initialize(x, y)
    @x = x
    @y = y
    @value = "   "
    @owner = nil
  end
end
