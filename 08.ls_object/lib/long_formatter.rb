# frozen_string_literal: true

require 'pathname'
require 'etc'

class LongFormatter
  def initialize(file_paths)
    @long_format_files = LongFormatFiles.new(file_paths)
  end

  def output
    print "total #{@long_format_files.blocks_sum}\n"
    @long_format_files.files.map do |file|
      print [file.type_and_mode.to_s,
             "  #{file.nlink.rjust(@long_format_files.nlink_max_size)}",
             " #{file.user.rjust(@long_format_files.user_max_size)}",
             "  #{file.group}",
             "  #{file.size.rjust(@long_format_files.size_max_size)}",
             " #{file.mtime}",
             " #{file.basename}\n"].join
    end
  end
end
