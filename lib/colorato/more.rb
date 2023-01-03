# frozen_string_literal: true

module Colorato; class << self

  def decolour(s)

    s.gsub(/\x1b\[\d+(;\d+)?m/, '')
  end

  def no_colour_length(s)

    decolour(s).length
  end

  def truncate_string(s, maxlen, post='...')

    post = '…' if post == :ellipsis

    ncl = no_colour_length(s)
    r = StringIO.new
    l = 0

    col = false

    s.scan(/(\x1b\[\d+(?:;\d+)?m|[^\x1b]+)/) do |ss, _|
      if ss[0, 1] == ""
        col = true
        r << ss
      else
        ss = ss[0, maxlen - l]
        r << ss
        l += ss.length
        break if l >= maxlen
      end
    end

    return r.string if l < maxlen

    r << "\e[0;0m" if col

    if post.is_a?(String)
      r << post
    elsif post.is_a?(Proc)
      r << post.call(ncl, maxlen, s)
    end

    r.string
  end

  alias decolor decolour

  alias bw_length no_colour_length
  alias nocolor_length no_colour_length
  alias no_color_length no_colour_length
  alias nocolour_length no_colour_length
end; end


