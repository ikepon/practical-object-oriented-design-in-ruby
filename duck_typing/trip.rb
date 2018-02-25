class Trip
  attr_reader :bicycles, :customers, :vehicle

  def initialize(bicycles:, customers: nil, vehicle: nil)
    @bicycles = bicycles
    @customers = customers
    @vehicle = vehicle
  end

  def prepare(preparers)
    preparers.each do |preparer|
      preparer.prepare_trip(self)
    end
  end
end

class Mechanic
  def prepare_trip(trip)
    trip.bicycles.each { |bicycle| prepare_bicycle(bicycle) }
  end

  def prepare_bicycle(bicycle)
    puts bicycle
  end
end

class TripCoordinator
  def prepare_trip(trip)
    trip.customers.each { |customer| puts customer }
  end
end

class Driver
  def prepare_trip(trip)
      puts 'vehicle gas up'
      puts 'vehicle fill water tank'
  end
end

bicycles = ['bike', 'bike2', 'bike3']
customers = ['aさん', 'bさん', 'cさん']
vehicle = 'バス'

trip = Trip.new(bicycles: bicycles, customers: customers, vehicle: vehicle)
mechanic = Mechanic.new
trip_coordinator = TripCoordinator.new
driver = Driver.new

trip.prepare([mechanic, trip_coordinator, driver])
