
$: << 'lib'
require 'colorato'

puts
puts "# TODO keep only what is necessary"
puts
puts "module Colo; class << self"
Colorato::COLOURS.each do |k, v|
  if v.match?(/\A\d/)
    puts "  def #{k}(s=nil); s ? \"[#{v}m\#{s}[0;0m\" : \"[#{v}m\"; end"
  else
    puts "  alias #{k} #{v}"
  end
end
puts "end; end"
puts
puts "module NoColo; class << self"
Colorato::COLOURS.each do |k, v|
  if v.match?(/\A\d/)
    puts "  def #{k}(s=nil); s ? s : ''; end"
  else
    puts "  alias #{k} #{v}"
  end
end
puts "end; end"

