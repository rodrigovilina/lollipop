# Changelog
All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

## [0.1.1] - 2020-06-11
### Changed
- README now includes a version badge 😉.

### Fixed
- When using on proyects with different `bundler` versions the gem wouldn't run,
  so the way the gems where being checked was changed from using
  `Bundler.load.specs` to `File.read('Gemfile.lock')`

## [0.1.0] - 2020-06-11
### Added
- Basic repo setup.
- `lollipop` script, that checks your bundle for the precense of an opinionated
  list of development gems.

[0.0.1]: https://github.com/vaporyhumo/lollipop/releases/tag/v0.1.0
