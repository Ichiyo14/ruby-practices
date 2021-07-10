#!/usr/bin/env ruby
# frozen_string_literal: true

require 'io/console'
require 'optparse'
require 'pathname'

require './lib/formatter'
require './lib/option'
require './lib/longformatfiles'
require './lib/longfile'
require './lib/shortformatfiles'


opt = ARGV.getopts('a', 'l', 'r')
path = ARGV[0] || '.'
pathname = Pathname(path)

files = Option.new(pathname)

if opt['a']
 files.a_option
end
if opt['r']
  files.r_option
end
if opt['l']
  puts files.l_option
else
  files.no_option
end
