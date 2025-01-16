
#
# Specifying colorato
#
# Mon Jan  2 13:29:33 JST 2023  Gli Uffizi
#

require 'pp'
require 'ostruct'

require 'colorato'


class Probatio::Context

  def jruby?; !! RUBY_PLATFORM.match(/java/); end
  def windows?; Gem.win_platform?; end
end

