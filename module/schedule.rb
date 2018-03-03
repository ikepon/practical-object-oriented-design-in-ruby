class Schedule
  def scheduled?(schedulable, start_date, end_date)
    puts "This #{schedulable.class} " +
         "is not scheduled\n" +
         " between #{start_date} and #{end_date}"
    false
  end
end


class Bicycle
  attr_reader :schedule, :size, :chain, :tire_size

  # Schedule を注入し初期値を設定
  def initialize(args={})
    @schedule = args[:schedule] || Schedule.new
    #...
  end

  # 与えられた期間に bicycle が利用可能なら true
  def schedulable?(start_date, end_date)
    !scheduled?(start_date - lead_days, end_date)
  end

  # scheduleの答えを返す
  def scheduled?(start_date, end_date)
    schedule.scheduled?(self, start_date, end_date)
  end

  # bicycle がスケジュール可能となるまでの準備日数
  def lead_days
    1
  end

  # ...
end

require 'date'
starting = Date.parse("2015/09/04")
ending = Date.parse("2015/09/10")

b = Bicycle.new

puts b.schedulable?(starting, ending)
