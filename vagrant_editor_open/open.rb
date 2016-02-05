#!/usr/bin/ruby

puts "\n\nTrying to open file...."
require_relative "extractor"

HOST_SOURCE_DIR = "/Users/celsodantas/Code/vagrant/src/shopify/" # Path to the shared directory on your machine.
EDITOR_BIN = "/usr/local/bin/atom" # Your editor path. Eg "/usr/bin/subl"

begin
  path = Extractor.extract_path(ARGV)
rescue => e
  puts e
  puts e.backtrace()
end

puts "path to file: #{path}"
`#{EDITOR_BIN} #{HOST_SOURCE_DIR}#{path}` if path
