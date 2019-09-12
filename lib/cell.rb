class Cell
  attr_accessor :value, :owner, :x, :y, :occupied, :token

  def initialize(x, y)
    @x = x
    @y = y
    @value = "   "
    @owner = nil
    @occupied = false
    @token = nil
  end

  def update_cell(token)
    @value = " #{token.symbol} "
    @owner = token.owner
    @occupied = true
    @token = token
  end
end
