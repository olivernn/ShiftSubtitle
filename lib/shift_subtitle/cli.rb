require 'optparse'
require 'open-uri'

module ShiftSubtitle
  class CLI
    def self.execute(stdout, arguments=[])

      options = {}

      optparse = OptionParser.new do |opts|
        opts.banner = "Usage: shift_subtitle.rb [options] input_file output_file"

        options[:operation] = ""
        opts.on('-p', '--operation OPERATION', 'add or sub') do |operation|
          options[:operation] = operation
        end

        options[:time] = ""
        opts.on('-t', '--time TIME', 'how much time to shift subtitles by') do |time|
          options[:time] = time
        end

        options[:start] = 1
        opts.on('-s', '--start_from [START]', 'where to start shifting subtitles from') do |start|
          options[:start] = start
        end

        options[:input_file] = ""
        opts.on('-i', '--input_file INPUT_FILE', 'the original subtitles') do |input_file|
          options[:input_file] = input_file
        end

        options[:output_file] = 
        opts.on('-o', '--output_file OUTPUT_FILE', 'where to save results') do |output_file|
          options[:output_file] = output_file
        end
      end

      optparse.parse!

      @time_shift_ms = options[:time].gsub(",", "").to_i
      @input_file_path = options[:input_file]
      @output_file_path = options[:output_file]
      @operation = options[:operation]
      @start = options[:start].to_i
      
      @subtitles = SRTParser.new(@input_file_path).subtitles
      
      output_file = File.new(@output_file_path, "w+")

      @subtitles.each do |subtitle|
        if @operation == "add"
          subtitle.shift_time_range_forward(@time_shift_ms) if subtitle.id >= @start
        elsif @operation == "sub"
          subtitle.shift_time_range_backward(@time_shift_ms) if subtitle.id >= @start
        end
        output_file.puts subtitle.to_s
        output_file.puts "\n"
      end

      output_file.close
    end
  end
end