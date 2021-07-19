# frozen_string_literal: true

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
      print [file.type_and_mode.to_s,
             "  #{file.nlink.rjust(files.nlink_max_size)}",
             " #{file.user.rjust(files.user_max_size)}",
             "  #{file.group}",
             "  #{file.size.rjust(files.size_max_size)}",
             " #{file.mtime}",
             " #{file.basename}\n"].join
    end
  end
end
