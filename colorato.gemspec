
Gem::Specification.new do |s|

  s.name = 'colorato'

  s.version = File.read(
    File.expand_path('../lib/colorato.rb', __FILE__)
  ).match(/ VERSION *= *['"]([^'"]+)/)[1]

  s.platform = Gem::Platform::RUBY
  s.authors = [ 'John Mettraux' ]
  s.email = [ 'jmettraux+flor@gmail.com' ]
  s.homepage = 'https://github.com/floraison/colorato'
  s.license = 'MIT'
  s.summary = 'terminal colors for flor'

  s.description = %{
terminal colors extracted from flor
  }.strip

  s.metadata = {
    'changelog_uri' => s.homepage + '/blob/master/CHANGELOG.md',
    'documentation_uri' => s.homepage,
    'bug_tracker_uri' => s.homepage + '/issues',
    #'mailing_list_uri' => 'https://groups.google.com/forum/#!forum/floraison',
    'homepage_uri' =>  s.homepage,
    'source_code_uri' => s.homepage,
    #'wiki_uri' => s.homepage + '/wiki',
    'rubygems_mfa_required' => 'true',
  }

  #s.files = `git ls-files`.split("\n")
  s.files = Dir[
    'README.{md,txt}',
    'CHANGELOG.{md,txt}', 'CREDITS.{md,txt}', 'LICENSE.{md,txt}',
    #'Makefile',
    'lib/**/*.rb', #'spec/**/*.rb', 'test/**/*.rb',
    "#{s.name}.gemspec",
  ]

  #s.add_runtime_dependency 'raabro', '~> 1.4'
  #s.add_runtime_dependency 'et-orbi', '~> 1', '>= 1.2.7'

  #s.add_development_dependency 'rspec', '~> 3.12'
  s.add_development_dependency 'probatio', '~> 1'

  s.require_path = 'lib'
end

