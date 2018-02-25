class Bicycle
  attr_reader :size, :tape_color

  def initialize(size:, tape_color:)
    @size = size
    @tape_color = tape_color
  end

  def spares
    {
      chain: '10-speed',
      tire_size: '23',
      tape_color: tape_color
    }
  end
end

bicycle = Bicycle.new(size: 'M', tape_color: 'red')
puts bicycle.size
puts bicycle.spares
