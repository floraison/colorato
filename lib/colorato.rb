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

  #%w[ (default) bright dim ].each do |filter|

  puts

  fs = %w[ (def) bright dim ]

  puts "%14s  %-9s  %-9s  %-9s" % ([ '' ] + fs)
  puts

  cs.each do |n|
    a = [ n ]
    fs.each do |f|
      f = Colorato.colours.send(f) rescue ''
      fgc = f + Colorato.colours.send(n)
      bgc = f + Colorato.colours.send("bg_#{n}")
      a << (fgc + 'Text' + Colorato.colours.reset)
      a << (bgc + '    ' + Colorato.colours.reset)
    end
    puts "%14s: %s %s  %s %s  %s %s" % a
  end

  puts
end
