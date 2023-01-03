
#
# Specifying colorato
#
# Tue Jan  3 13:30:33 JST 2023  Gli Uffizi
#

require 'spec_helper'


describe 'Colorato more' do

  before :all do

    @colours = Colorato.colours
  end

  describe '.decolour' do

    it 'removes colours from strings' do

      expect(@colours.blue('turbine')).to eq("\e[34mturbine\e[0;0m")

      expect(Colorato.decolour(@colours.blue('turbine'))).to eq('turbine')
      expect(Colorato.decolor(@colours.blue('turbine'))).to eq('turbine')
    end
  end

  describe '.no_colour_length' do

    it 'returns the no colour length' do

      expect(Colorato.no_colour_length(@colours.blue('turbine'))).to eq(7)
      expect(Colorato.no_color_length(@colours.blue('turbine'))).to eq(7)
      expect(Colorato.nocolour_length(@colours.blue('turbine'))).to eq(7)
      expect(Colorato.nocolor_length(@colours.blue('turbine'))).to eq(7)
      expect(Colorato.bw_length(@colours.blue('turbine'))).to eq(7)
    end
  end

  describe '.truncate_string' do

    it 'truncates a bw string' do

      s = "hello #{@colours.blue('world')}!"

      expect(Colorato.truncate_string(s, 7)).to eq("hello \e[34mw\e[0;0m...")
    end

    it 'truncates a colour string' do

      s = 'hello turbine!'

      expect(Colorato.truncate_string(s, 7)).to eq('hello t...')
    end

    it 'accepts an arbitrary ellipsis' do

      s0 = "hello #{@colours.blue('world')}!"
      s1 = 'hello Olaf!'

      expect(Colorato.truncate_string(s0, 8, 'X')
        ).to eq("hello \e[34mwo\e[0;0mX")
      expect(Colorato.truncate_string(s1, 8, 'X')
        ).to eq('hello OlX')
    end

    it 'accepts :ellipsis' do

      s0 = "hello #{@colours.blue('world')}!"
      s1 = 'hello Olaf!'

      expect(Colorato.truncate_string(s0, 8, :ellipsis)
        ).to eq("hello \e[34mwo\e[0;0m…")
      expect(Colorato.truncate_string(s1, 8, :ellipsis)
        ).to eq('hello Ol…')
    end
  end
end

