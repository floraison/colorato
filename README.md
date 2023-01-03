
# colorato

ANSI colours tool. Taken out of [flor](https://github.com/floraison/flor).


## Usage

```ruby
require 'colorato'

C = Colorato.colours
NC = Colorato.nocolours

C.blue # => "\e[34m"
C.blue('car') # => "\e[34mcar\e[0;0m"

NC.blue('car') # => "car"
```

### .decolour(string)

```ruby
Colorato.decoulour("car") # => 'car'
Colorato.decoulour("\e[34mcar\e[0;0m") # => 'car'
```

### .nocolour_length(string)

```ruby
Colorato.nocolour_length("car") # => 3
Colorato.nocolour_length("\e[34mcar\e[0;0m") # => 3
```

### .truncate_string(string, maxlength, ellipsis='...')

```ruby
Colorato.truncate_string("hello world!", 7)
  # => "hello w..."
Colorato.truncate_string("hello #{@colours.blue('world')}!", 7)
  # => "hello \e[34mw\e[0;0m..."

Colorato.truncate_string("hello world!", 7, 'XXX')
  # => "hello wXXX"
Colorato.truncate_string("hello #{@colours.blue('world')}!", 7, 'XXX')
  # => "hello \e[34mw\e[0;0mXXX"

Colorato.truncate_string("hello world!", 7, :ellipsis)
  # => "hello Ol…"
Colorato.truncate_string("hello #{@colours.blue('world')}!", 7, :ellipsis)
  # => "hello \e[34mw\e[0;0m…"
```

### colours

```ruby
  def reset(s=nil)
  def bright(s=nil)
  def dim(s=nil)
  def underlined(s=nil)
  def blink(s=nil)
  def reverse(s=nil)
  def hidden(s=nil)
  def strike(s=nil)
  def default(s=nil)
  def black(s=nil)
  def red(s=nil)
  def green(s=nil)
  def yellow(s=nil)
  def blue(s=nil)
  def magenta(s=nil)
  def cyan(s=nil)
  def light_gray(s=nil)
  def dark_gray(s=nil)
  def light_red(s=nil)
  def light_green(s=nil)
  def light_yellow(s=nil)
  def light_blue(s=nil)
  def light_magenta(s=nil)
  def light_cyan(s=nil)
  def white(s=nil)
  def bg_default(s=nil)
  def bg_black(s=nil)
  def bg_red(s=nil)
  def bg_green(s=nil)
  def bg_yellow(s=nil)
  def bg_blue(s=nil)
  def bg_magenta(s=nil)
  def bg_cyan(s=nil)
  def bg_light_gray(s=nil)
  def bg_dark_gray(s=nil)
  def bg_light_red(s=nil)
  def bg_light_green(s=nil)
  def bg_light_yellow(s=nil)
  def bg_light_blue(s=nil)
  def bg_light_magenta(s=nil)
  def bg_light_cyan(s=nil)
  def bg_white(s=nil)
  alias brown yellow
  alias purple magenta
  alias dark_grey dark_gray
  alias light_grey light_gray
  alias rd red
  alias bl blue
  alias bu blue
  alias ba black
  alias bk black
  alias gn green
  alias gr green
  alias dg dark_gray
  alias gy light_gray
  alias lg light_gray
  alias yl yellow
  alias y yellow
  alias ma magenta
  alias wt white
  alias rs reset
  alias br bright
  alias bri bright
  alias un underlined
  alias rv reverse
  alias bn blink
  alias blg bg_light_gray
  alias und underlined
  alias rev reverse
```

### colo.rb

```
make colo.rb
```

Generates a static `colo.rb` ready to be shrunk and pasted in a project.


## LICENSE

MIT, see [LICENSE.txt](LICENSE.txt)

