
#
# Specifying colorato
#
# Mon Jan  2 13:30:59 JST 2023  Gli Uffizi
#


group Colorato do

  group '.colours' do

    group '.blue' do

      test 'wraps a string' do

        assert Colorato.colours.blue('nada'), "\e[34mnada\e[0;0m"
      end

      test 'returns the code string' do

        assert Colorato.colours.blue, "\e[34m"
      end
    end
  end
end

group Colorato do
  group '.no_colours' do

    group '.blue' do

      test 'wraps a string' do

        assert Colorato.no_colours.blue('nada'), 'nada'
      end

      test 'returns the code string' do

        assert Colorato.no_colours.blue, ''
      end
    end
  end
end

