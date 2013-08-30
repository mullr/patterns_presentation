class SumCalculator
  def run(a, b)
    a + b
  end
end

class DifferenceCalculator
  def run(a, b)
    a - b
  end
end

class CalculatorLogger
  def initialize(delegate)
     @delegate = delegate
  end

  def run(a, b)
    puts "Running #{@delegate.class} with #{a} and #{b}"
    result = @delegate.run(a, b)
    puts "Finished running with result #{result}"
  end
end

summer = CalculatorLogger.new(SumCalculator.new)
differ = CalculatorLogger.new(DifferenceCalculator.new)

summer.run(2, 1)
puts '---'
differ.run(2, 1)
