
#
# Specifying colorato
#
# Mon Jan  2 13:30:59 JST 2023  Gli Uffizi
#

require 'spec_helper'


describe Colorato do

  describe '.colours' do

    describe '.blue' do

      it 'wraps a string' do

        expect(Colorato.colours.blue('nada')).to eq("\e[34mnada\e[0;0m")
      end

      it 'returns the code string' do

        expect(Colorato.colours.blue).to eq("\e[34m")
      end
    end
  end

  {

    {} => ::Colorato::Colours,
    { color: true } => ::Colorato::Colours,
    { 'color' => true } => ::Colorato::Colours,
    { colour: true } => ::Colorato::Colours,
    { 'colour' => true } => ::Colorato::Colours,
    { colors: true } => ::Colorato::Colours,
    { 'colors' => true } => ::Colorato::Colours,
    { colours: true } => ::Colorato::Colours,
    { 'colours' => true } => ::Colorato::Colours,

    { color: false } => ::Colorato::NoColours,
    { 'color' => false } => ::Colorato::NoColours,
    { colour: false } => ::Colorato::NoColours,
    { 'colour' => false } => ::Colorato::NoColours,
    { colors: false } => ::Colorato::NoColours,
    { 'colors' => false } => ::Colorato::NoColours,
    { colours: false } => ::Colorato::NoColours,
    { 'colours' => false } => ::Colorato::NoColours,

  }.each do |k, v|

    it ".colours(#{k.inspect[1..-2]}) returns a #{v} instance" do

      r = ::Colorato.colours(k)
      expect(r.class).to eq(v)
    end
  end
end

describe Colorato do
  describe '.no_colours' do

    describe '.blue' do

      it 'wraps a string' do

        expect(Colorato.no_colours.blue('nada')).to eq('nada')
      end

      it 'returns the code string' do

        expect(Colorato.no_colours.blue).to eq('')
      end
    end
  end
end

