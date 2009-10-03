require File.dirname(__FILE__) + '/test_helper.rb'

class TestTimeRange < Test::Unit::TestCase
  
  def setup
    @time_range = TimeRange.new("01:31:51,210")
  end
  
  def test_hours_parsing
    assert_equal 1, @time_range.hours
  end
  
  def test_minutes_parsing
    assert_equal 31, @time_range.minutes
  end
  
  def test_seconds_parsing
    assert_equal 51, @time_range.seconds
  end
  
  def test_millieseconds_parsing
    assert_equal 210, @time_range.millieseconds
  end
  
  def test_to_ms
    assert_equal 5511210, @time_range.to_ms
  end
  
  def test_from_ms
    @time_range.from_ms(5511210)
    assert_equal 1, @time_range.hours
    assert_equal 31, @time_range.minutes
    assert_equal 51, @time_range.seconds
    assert_equal 210, @time_range.millieseconds
  end
  
  def test_to_s
    assert_equal "01:31:51,210", @time_range.to_s
  end
end