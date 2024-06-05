# frozen_string_literal: true

Gem::Specification.new do |spec|
  spec.name          = 'lollipop'
  spec.version       = '0.5.0'

  spec.authors       = ['vaporyhumo']
  spec.email         = ['roanvilina@gmail.com']

  spec.summary       = 'Development dependencies collection'
  spec.description   = spec.summary
  spec.license       = 'Unlicense'

  spec.homepage      = 'https://github.com/vaporyhumo/lollipop'
  spec.metadata      = {
    'bug_tracker_uri' => "#{spec.homepage}/issues",
    'changelog_uri' => "#{spec.homepage}/blob/main/CHANGELOG.md",
    'documentation_uri' => 'https://www.rubydoc.info/gems/lollipop',
    'source_code_uri' => spec.homepage
  }

  spec.files = []

  spec.required_ruby_version = Gem::Requirement::new('~> 3.1')

  spec.add_dependency 'bundler-audit'
  spec.add_dependency 'byebug'
  spec.add_dependency 'flay'
  spec.add_dependency 'flog'
  spec.add_dependency 'guard'
  spec.add_dependency 'guard-rspec'
  spec.add_dependency 'guard-rubocop'
  spec.add_dependency 'guard-shell'
  spec.add_dependency 'irb'
  spec.add_dependency 'lefthook'
  spec.add_dependency 'libyear-bundler'
  spec.add_dependency 'mutant-rspec'
  spec.add_dependency 'rake'
  spec.add_dependency 'rspec'
  spec.add_dependency 'rubocop'
  spec.add_dependency 'rubocop-performance'
  spec.add_dependency 'rubocop-rake'
  spec.add_dependency 'rubocop-rspec'
  spec.add_dependency 'rubocop-sorbet'
  spec.add_dependency 'simplecov'
  spec.add_dependency 'sorbet'
  spec.add_dependency 'sorbet-progress'
  spec.add_dependency 'terminal-notifier-guard'
end
