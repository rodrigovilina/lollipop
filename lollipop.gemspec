# frozen_string_literal: true

require_relative 'lib/lollipop/version'

Gem::Specification.new do |spec|
  spec.name          = 'lollipop'
  spec.version       = Lollipop::VERSION

  spec.authors       = ['vaporyhumo']
  spec.email         = ['roanvilina@gmail.com']

  spec.summary       = 'Candy'
  spec.description = <<~DESC
    Candy.
  DESC
  spec.license       = 'Unlicense'

  spec.homepage      = 'https://github.com/vaporyhumo/lollipop'
  spec.metadata = {
    'bug_tracker_uri'   => spec.homepage + '/issues',
    'changelog_uri'     => spec.homepage + '/blob/master/CHANGELOG.md',
    'documentation_uri' => 'https://www.rubydoc.info/gems/lollipop',
    'source_code_uri'   => spec.homepage
  }

  spec.files         = Dir['lib/**/{*,.*}']
  spec.bindir        = 'exe'
  spec.executables   = %w[lollipop lol]

  spec.required_ruby_version = '>= 2.4.0'
end
