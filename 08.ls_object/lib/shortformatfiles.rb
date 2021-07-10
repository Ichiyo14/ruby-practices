require 'pathname'

class ShortFormatFiles
  attr_reader :file_paths, :name
  def initialize(file_paths)
    @file_paths = file_paths
    @names = build_name_array
  end
  def self.multiples_of_three?(files)
    (files.size % 3) == 0
  end

  def build_name_array
    file_paths.map do |file_path|
      "#{File.basename(file_path).ljust(10)}"
    end
  end


end
