# frozen_string_literal: true

class Command
  attr_reader :pathname

  def initialize(pathname, all: false, reverse: false)
    @files = Dir.glob((pathname).join('*')).sort
    @files = Dir.glob((pathname).join('*'), File::FNM_DOTMATCH).sort if all
    @files.reverse! if reverse
    @pathname = pathname
  end

  def target_files
    Dir.glob((@pathname).join('*')).sort
  end

  def print_l_option
    LongFormatter.new(@files).output
  end

  def print_no_option
    ShortFormatter.new(@files).output
  end
end
