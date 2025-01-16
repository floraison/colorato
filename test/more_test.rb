
#
# Specifying colorato
#
# Tue Jan  3 13:30:33 JST 2023  Gli Uffizi
#


group 'Colorato more' do

  setup do

    @colours = Colorato.colours
  end

  group '.decolour' do

    test 'removes colours from strings' do

      assert(@colours.blue('turbine'), "\e[34mturbine\e[0;0m")

      assert(Colorato.decolour(@colours.blue('turbine')), 'turbine')
      assert(Colorato.decolor(@colours.blue('turbine')), 'turbine')
    end
  end

  group '.no_colour_length' do

    test 'returns the no colour length' do

      assert(Colorato.no_colour_length(@colours.blue('turbine')), 7)
      assert(Colorato.no_color_length(@colours.blue('turbine')), 7)
      assert(Colorato.nocolour_length(@colours.blue('turbine')), 7)
      assert(Colorato.nocolor_length(@colours.blue('turbine')), 7)
      assert(Colorato.bw_length(@colours.blue('turbine')), 7)
    end
  end

  group '.truncate_string' do

    test 'truncates a bw string' do

      s = "hello #{@colours.blue('world')}!"

      assert(Colorato.truncate_string(s, 7), "hello \e[34mw\e[0;0m...")
    end

    test 'truncates a colour string' do

      s = 'hello turbine!'

      assert(Colorato.truncate_string(s, 7), 'hello t...')
    end

    test 'accepts an arbitrary ellipsis' do

      s0 = "hello #{@colours.blue('world')}!"
      s1 = 'hello Olaf!'

      assert(Colorato.truncate_string(s0, 8, 'X'), "hello \e[34mwo\e[0;0mX")
      assert(Colorato.truncate_string(s1, 8, 'X'), 'hello OlX')
    end

    test 'accepts :ellipsis' do

      s0 = "hello #{@colours.blue('world')}!"
      s1 = 'hello Olaf!'

      assert(
        Colorato.truncate_string(s0, 8, :ellipsis), "hello \e[34mwo\e[0;0m…")
      assert(
        Colorato.truncate_string(s1, 8, :ellipsis), 'hello Ol…')
    end
  end
end

