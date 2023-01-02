# frozen_string_literal: true

module Colorato

  COLOURS = Hash[*%w[

    reset 0;0
    bright 1 dim 2 underlined 4 blink 5 reverse 7 hidden 8 strike 9 default 39
    black 30 red 31 green 32 yellow 33 blue 34 magenta 35 cyan 36
    light_gray 37 dark_gray 90 light_red 91 light_green 92
    light_yellow 93 light_blue 94 light_magenta 95 light_cyan 96 white 97
    bg_default 49 bg_black 40 bg_red 41 bg_green 42 bg_yellow 43 bg_blue 44
    bg_magenta 45 bg_cyan 46 bg_light_gray 47 bg_dark_gray 100
    bg_light_red 101 bg_light_green 102 bg_light_yellow 103
    bg_light_blue 104 bg_light_magenta 105 bg_light_cyan 106
    bg_white 107

    brown yellow purple magenta dark_grey dark_gray light_grey light_gray

    rd red bl blue bu blue ba black bk black gn green gr green dg dark_gray
    gy light_gray lg light_gray yl yellow y yellow ma magenta wt white
    rs reset
    br bright bri bright un underlined rv reverse bn blink blg bg_light_gray
    und underlined rev reverse
  ]].freeze

  class Colours

    Colorato::COLOURS.each do |k, v|
      if v.match?(/\A\d/)
        class_eval(%{
          def #{k}(s=nil)
           s ? "[#{v}m" + s + "[0;0m" : "[#{v}m"
           end })
      else
        class_eval(
          "alias #{k} #{v}")
      end
    end
  end

  class NoColours

    Colorato::COLOURS.each do |k, v|
      if v.match?(/\A\d/)
        class_eval("def #{k}(s=''); s; end")
      else
        class_eval("alias #{k} #{v}")
      end
    end
  end

  @colours = Colours.new
  @no_colours = NoColours.new

  def self.no_colours

    @no_colours
  end

  def self.colours(opts={})

    c = nil;
      [ :color, :colour, :colors, :colours ].each do |k|
        if opts.has_key?(k); c = opts[k]; break; end
      end

    return @colours if c == true
    return @no_colours if c == false

    o = opts[:out] || $stdout

    return @colours if (
      (o.respond_to?(:log_colours?) ? o.log_colours? : o.tty?) ||
      ($0[-6..-1] == '/rspec' &&
        (ARGV.include?('--tty') || ARGV.include?('--color'))))

    @no_colours
  end
end

