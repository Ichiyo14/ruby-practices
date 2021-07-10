require 'pathname'
require 'etc'

class LongFormatter
  attr_reader :files
  def initialize(file_paths)
    @files = LongFormatFiles.new(file_paths)
  end
  def format
    print "total #{files.blocks_sum}\n"
    files.long_format_files.map do |file|
    ["#{file.type_and_mode}",
      "  #{file.nlink.rjust(files.nlink_max_size)}",
      " #{file.user.rjust(files.user_max_size)}",
      "  #{file.group}",
      "  #{file.size.rjust(files.size_max_size)}",
      " #{file.mtime}",
      " #{file.basename}",].join
    end
  end
end

class ShortFormatter
  attr_reader :files, :three_rows_files
  def  initialize(file_paths)
    @files =  ShortFormatFiles.new(file_paths).build_name_array
    @three_rows_files = three_rows_order(files)
  end

  def format
    three_rows_files.each do |three_set_files|
      three_set_files.each { |file| print file }
      print "\n"
    end
  end

private
  def three_rows_order(array)
    array << '' until ShortFormatFiles.three_times?(array)
    slice_files = array.each_slice(array.size / 3).to_a
    slice_files.transpose
  end
end
