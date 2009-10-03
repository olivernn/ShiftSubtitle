class TimeRange
  
  attr_accessor :hours, :minutes, :seconds, :millieseconds
  
  def initialize(time)
    @time = time
    parse
  end
  
  def to_ms
    @millieseconds + (@seconds * 1000) + (@minutes * 60000) + (@hours * 3600000)
  end
  
  def from_ms(ms)
    t = Time.at(ms/1000)
    @hours = t.hour - 1 #epoch was at 01:00:00!
    @minutes = t.min
    @seconds = t.sec
    @millieseconds = ms.to_s.reverse.slice(0,3).reverse.to_i
  end
  
  def to_s
    hours_to_s + ":" + minutes_to_s + ":" + seconds_to_s + "," + millieseconds_to_s
  end
  
  private
  
  def parse
    time_split = @time.split(':')
    @hours = time_split[0].to_i
    @minutes = time_split[1].to_i
    @seconds = time_split[2].split(',')[0].to_i
    @millieseconds = time_split[2].split(',')[1].to_i
  end
  
  def hours_to_s
    if @hours.to_s.length == 2
      @hours.to_s
    else
      @hours.to_s.rjust(2, "0")
    end
  end
  
  def minutes_to_s
    if @minutes.to_s.length == 2
      @minutes.to_s
    else
      @minutes.to_s.rjust(2, "0")
    end
  end
  
  def seconds_to_s
    if @seconds.to_s.length == 2
      @seconds.to_s
    else
      @seconds.to_s.rjust(2, "0")
    end
  end
  
  def millieseconds_to_s
    if @millieseconds.to_s.length == 3
      @millieseconds.to_s
    else
      @millieseconds.to_s.rjust(3, "0")
    end
  end
end