# frozen_string_literal: true

class Option
  attr_reader :pathname

  def initialize(pathname)
    @files = Dir.glob((pathname).join('*')).sort
    @pathname = pathname
  end

  def a_option
    @files = Dir.glob((pathname).join('*'), File::FNM_DOTMATCH).sort
  end

  def r_option
    @files.reverse!
  end

  def l_option
    LongFormatter.new(@files).format
  end

  def no_option
    ShortFormatter.new(@files).format
  end
end
