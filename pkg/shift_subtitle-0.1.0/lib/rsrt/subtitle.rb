class Subtitle
  
  attr_reader :start_time, :end_time, :id, :text
  
  def initialize(details={})
    @id = details[:id].to_i
    @text = details[:text]
    parse_time_range(details[:time_range])
  end
  
  def shift_time_range_forward(shift)
    @start_time.from_ms(@start_time.to_ms + shift)
    @end_time.from_ms(@end_time.to_ms + shift)
  end
  
  def shift_time_range_backward(shift)
    @start_time.from_ms(@start_time.to_ms - shift)
    @end_time.from_ms(@end_time.to_ms - shift)
  end
  
  def to_s
    @id.to_s + "\n" + @start_time.to_s + " --> " + @end_time.to_s + "\n" + @text.to_s
  end
  
  private
  
  def parse_time_range(time_range)
    @start_time = TimeRange.new(time_range.split(" --> ")[0])
    @end_time = TimeRange.new(time_range.split(" --> ")[1])
  end
end