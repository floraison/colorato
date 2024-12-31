# frozen_string_literal: true


module Colorato

  VERSION = '1.0.1'
end

require 'colorato/core'
require 'colorato/more'


if __FILE__ == $0

  cs = Colorato.colours.public_methods
    .inject([]) { |a, n|
      m = n.to_s.match(/^bg_(.+)$/)
      a << m[1] if m
      a }

  %w[ (default) bright dim ].each do |filter|

    puts
    puts filter

    f = Colorato.colours.send(filter) rescue ''

    cs.each { |n|
      fgc = f + Colorato.colours.send(n)
      bgc = f + Colorato.colours.send("bg_#{n}")
      t0 = fgc + 'Text' + Colorato.colours.reset
      t1 = bgc + '    ' + Colorato.colours.reset
      puts "%14s: %s %s" % [ n, t0, t1 ] }
  end

  puts
end
