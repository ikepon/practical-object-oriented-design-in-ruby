class Schedule
  def scheduled?(schedulable, start_date, end_date)
    puts "This #{schedulable.class} " +
         "is not scheduled\n" +
         " between #{start_date} and #{end_date}"
    false
  end
end

module Schedulable
  attr_writer :schedule

  def schedule
    @schedule ||= ::Schedule.new
  end

  # 与えられた期間に bicycle が利用可能なら true
  def schedulable?(start_date, end_date)
    !scheduled?(start_date - lead_days, end_date)
  end

  # scheduleの答えを返す
  def scheduled?(start_date, end_date)
    schedule.scheduled?(self, start_date, end_date)
  end

  # 必要に応じて include する側で置き換える
  # このmodule内で lead_days を使っているので実装が必要(P191)
  def lead_days
    0
  end
end


class Bicycle
  include Schedulable
  attr_reader :size, :chain, :tire_size

  def initialize(args={})
    #...
  end

  # bicycle がスケジュール可能となるまでの準備日数
  def lead_days
    1
  end

  # ...
end

class Vehicle
  include Schedulable

  def lead_days
    3
  end

  # ....
end

class Mechanic
  include Schedulable

  def lead_days
    4
  end
end

require 'date'
starting = Date.parse("2015/09/04")
ending = Date.parse("2015/09/10")

b = Bicycle.new
puts b.schedulable?(starting, ending)

v = Vehicle.new
puts v.schedulable?(starting, ending)

m = Mechanic.new
puts m.schedulable?(starting, ending)
