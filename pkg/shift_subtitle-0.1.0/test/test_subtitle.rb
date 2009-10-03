require File.dirname(__FILE__) + '/test_helper.rb'

class TestSubtitle < Test::Unit::TestCase

  def setup
    @subtitle = Subtitle.new(:id =>"100", :time_range => "01:31:51,210 --> 01:31:54,893", :text => "MNU Head Office")
  end
  
  def test_time_range_parsing
    assert_equal 1, @subtitle.start_time.hours
    assert_equal 1, @subtitle.end_time.hours
    
    assert_equal 31, @subtitle.start_time.minutes
    assert_equal 54, @subtitle.end_time.seconds
  end
  
  def test_id
    assert_equal 100, @subtitle.id
  end
  
  def test_shift_time_range_forward
    @subtitle.shift_time_range_forward(1000)
    assert_equal 52, @subtitle.start_time.seconds
    assert_equal 55, @subtitle.end_time.seconds
    
    assert_equal 1, @subtitle.start_time.hours
    assert_equal 893, @subtitle.end_time.millieseconds
  end
  
  def test_shift_time_range_backward
    @subtitle.shift_time_range_backward(1500)
    assert_equal 49, @subtitle.start_time.seconds
    assert_equal 53, @subtitle.end_time.seconds
    
    assert_equal 710, @subtitle.start_time.millieseconds
    assert_equal 393, @subtitle.end_time.millieseconds
  end
  
  def test_to_s
    assert_equal expected_subtitle_to_s, @subtitle.to_s
  end
  
  private
  
  def expected_subtitle_to_s
    "100\n01:31:51,210 --> 01:31:54,893\nMNU Head Office"
  end
end