# frozen_string_literal: true

# Represents a car that can drive.
# This class demonstrates basic vehicle functionality.
class Car
  # attr_accessor :name
  attr_reader :name

  def initialize(name)
    @name = name
  end

  def hello
    puts "Hello, I am #{@name}"
  end
  # def name
  #   @name
  # end

  # def name=(value)
  #   @name=value
  # end
end

car = Car.new('riku')
car.hello
puts car.name

# car.name = 'nishikawa'
car.hello
puts car.name
