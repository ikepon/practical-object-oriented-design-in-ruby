class Trip
  attr_reader :bicycles, :customers, :vehicle

  def initialize(bicycles:, customers: nil, vehicle: nil)
    @bicycles = bicycles
    @customers = customers
    @vehicle = vehicle
  end

  def prepare(mechanic)
    mechanic.prepare_bicycles(bicycles)
  end
end

class Mechanic
  def prepare_bicycles(bicycles)
    bicycles.each { |bicycle| prepare_bicycle(bicycle) }
  end

  def prepare_bicycle(bicycle)
    puts bicycle
  end
end

bicycles = ['bike', 'bike2', 'bike3']

trip = Trip.new(bicycles: bicycles)
mechanic = Mechanic.new

trip.prepare(mechanic)
