
#
# Specifying colorato
#
# Mon Jan  2 13:29:33 JST 2023  Gli Uffizi
#

require 'pp'
require 'ostruct'

require 'colorato'


module Helpers

  def jruby?; !! RUBY_PLATFORM.match(/java/); end
  def windows?; Gem.win_platform?; end
end # Helpers

RSpec.configure do |c|

  c.alias_example_to(:they)
  c.alias_example_to(:so)
  c.include(Helpers)
end

