class Calculator
  def initialize(value1, value2)
    @value1 = value1
    @value2 = value2
  end

  def add
    sum = @value1 + @value2
    puts sum
  end

  def subtract
    difference = @value1 - @value2
    puts difference
  end
end

calc = Calculator.new(20,11)
puts calc.add
puts calc.subtract