class AModel
  def initialize()
    @a = 1
    @observers = []
  end

  def a
    @a
  end

  def a=(val)
    @a = val
    @observers.each do |observer|
      observer.call(val)
    end
  end
  
  def observe_a_with(proc)
    @observers.push(proc)
  end
end

test = AModel.new
test.observe_a_with ->(val) { puts "The value of a is #{val}" }

test.a = 42
