require 'open-uri'

class SRTParser
  
  attr_reader :subtitles
  
  def initialize(srt_file_path)
    @srt_file_path = srt_file_path
    @regex_subtitle_id = Regexp.new('^\d+$')
    @regex_time_range = Regexp.new('^\d{2}:\d{2}:\d{2},\d{3} --> \d{2}:\d{2}:\d{2},\d{3}$')
    @regex_text = Regexp.new('^.+$')
    @subtitles = Array.new
    parse
  end
  
  private
  
  def parse
    subtitle_details = {}
    subtitle_details[:text] = ""
    
    File.open(@srt_file_path).each do |line|
      if @regex_subtitle_id.match(line)
        subtitle_details[:id] = line
      elsif @regex_time_range.match(line)
        subtitle_details[:time_range] = line
      elsif @regex_text.match(line)
        subtitle_details[:text] += line
      else # we think this is the end of the subtitle
        @subtitles << Subtitle.new(subtitle_details)
        subtitle_details[:text] = ""
      end
    end
  end
end