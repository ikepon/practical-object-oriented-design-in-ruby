class Trip
  attr_reader :bicycles, :customers, :vehicle

  def initialize(bicycles:, customers: nil, vehicle: nil)
    @bicycles = bicycles
    @customers = customers
    @vehicle = vehicle
  end

  def prepare(preparers)
    preparers.each do |preparer|
      case preparer
        when Mechanic
          preparer.prepare_bicycles(bicycles)
        when TripCoordinator
          preparer.buy_food(customers)
        when Driver
          preparer.gas_up(vehicle)
          preparer.fill_water_tank(vehicle)
      end
    end
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

class TripCoordinator
  def buy_food(customers)
    customers.each { |customer| puts customer }
  end
end

class Driver
  def gas_up(vehicle)
    puts 'vehicle gas up'
  end

  def fill_water_tank(vehicle)
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
