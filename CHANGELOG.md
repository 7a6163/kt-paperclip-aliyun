# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [0.2.0] - 2025-12-05

### Added
- Ruby 3.0+ support (tested on Ruby 2.7, 3.0, 3.1, 3.2, 3.3)
- GitHub Actions CI/CD workflow replacing Travis CI
- WebMock integration for testing without real Aliyun credentials
- Comprehensive test suite improvements

### Changed
- **BREAKING**: Minimum Ruby version is now 2.7.0 (was 2.6.0)
- Updated `rest-client` dependency from `>= 1.6.7` to `>= 2.0.0` for Ruby 3 compatibility
- Updated test dependencies:
  - `activerecord` from `~> 4.0.0` to `>= 5.0`
  - `rspec` from `~> 3.3.0` to `~> 3.10`
  - `rubocop` from `~> 0.34.2` to `~> 1.0`
- Gem source changed from `gems.ruby-china.com` to `rubygems.org`
- Replaced deprecated `URI.encode` with `URI::DEFAULT_PARSER.escape` for Ruby 3.0+ compatibility

### Fixed
- Fixed Ruby 3.0+ compatibility issues with URI encoding
- Fixed all test failures by improving test isolation and mock setup
- Renamed test fixture file from Chinese characters to `chinese-name.jpg` for better compatibility

### Deprecated
- Travis CI configuration (replaced with GitHub Actions)

## [0.1.6] - 2020-04-20

### Fixed
- Fixed argument pollution in #get_endpoint

## Previous versions

See git history for changes in versions prior to 0.2.0.

[0.2.0]: https://github.com/Martin91/paperclip-storage-aliyun/compare/v0.1.6...v0.2.0
[0.1.6]: https://github.com/Martin91/paperclip-storage-aliyun/compare/v0.1.5...v0.1.6
