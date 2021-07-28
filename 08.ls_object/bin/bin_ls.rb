#!/usr/bin/env ruby
# frozen_string_literal: true

require 'io/console'
require 'optparse'
require 'pathname'

require_relative '../lib/long_formatter'
require_relative '../lib/short_formatter'
require_relative '../lib/command'
require_relative '../lib/long_format_files'
require_relative '../lib/long_file'
require_relative '../lib/short_format_files'

opt = ARGV.getopts('a', 'l', 'r')
path = ARGV[0] || '.'
pathname = Pathname(path)

command = Command.new(pathname, all: opt['a'], reverse: opt['r'])

if opt['l']
  command.print_l_option
else
  command.print_no_option
end
