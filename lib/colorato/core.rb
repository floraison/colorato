# frozen_string_literal: true


module Colorato

  COLOURS = Hash[*%w[

    reset 0;0

    bright 1 dim 2 underlined 4 blink 5 reverse 7 hidden 8 strike 9 default 39

    black 30 red 31 green 32 yellow 33 blue 34 magenta 35 cyan 36
    light_gray 37 dark_gray 90 light_red 91 light_green 92 light_yellow 93
    light_blue 94 light_magenta 95 light_cyan 96 white 97

    bg_default 49 bg_black 40 bg_red 41 bg_green 42 bg_yellow 43 bg_blue 44
    bg_magenta 45 bg_cyan 46 bg_light_gray 47 bg_dark_gray 100
    bg_light_red 101 bg_light_green 102 bg_light_yellow 103
    bg_light_blue 104 bg_light_magenta 105 bg_light_cyan 106 bg_white 107

    brown yellow purple magenta dark_grey dark_gray light_grey light_gray

    rd red bl blue bu blue ba black bk black gn green gr green dg dark_gray
    gy light_gray lg light_gray yl yellow y yellow ma magenta wt white
    rs reset
    br bright bri bright un underlined rv reverse bn blink blg bg_light_gray
    und underlined rev reverse

  ]].freeze

  class Colours; end
  class NoColours; end
    #
  Colorato::COLOURS.each do |k, v|

    if v.match(/\A\d/) # Ruby 2.3 doesn't have String#match?

      ::Colorato::Colours.class_eval(%{
        def #{k}(s=nil)
          s ?
            "\e[#{v}m\#{s}\e[0;0m" :
            "\e[#{v}m"
        end })
      ::Colorato::NoColours.class_eval(%{
        def #{k}(s=nil)
          s ?
            s :
            ''
        end })

    else

      c = %{ alias #{k} #{v} }
      ::Colorato::Colours.class_eval(c)
      ::Colorato::NoColours.class_eval(c)
    end
  end

  class << self

    def colours

      @colours ||= Colours.new
    end

    def no_colours

      @no_colours ||= NoColours.new
    end

    alias colors colours
    alias nocolors no_colours
    alias no_colors no_colours
  end
end

