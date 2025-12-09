# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [1.0.0] - 2025-12-09

### BREAKING CHANGES
- **Gem renamed from `paperclip-storage-aliyun` to `kt-paperclip-aliyun`**
  - Main require file changed from `paperclip-storage-aliyun` to `kt-paperclip-aliyun`
  - Update your Gemfile: `gem 'kt-paperclip-aliyun'` instead of `gem 'paperclip-storage-aliyun'`
  - Update your requires: `require 'kt-paperclip-aliyun'` instead of `require 'paperclip-storage-aliyun'`
- **Repository ownership transferred to 7a6163**

### Added
- Ruby 3.0+ support (tested on Ruby 2.7, 3.0, 3.1, 3.2, 3.3)
- GitHub Actions CI/CD workflow replacing Travis CI
- CodeCov integration for code coverage tracking
- WebMock integration for testing without real Aliyun credentials
- Comprehensive test suite improvements
- Gem metadata for better RubyGems.org integration

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

See git history for changes in versions prior to 1.0.0.

[1.0.0]: https://github.com/7a6163/kt-paperclip-aliyun/compare/v0.1.6...v1.0.0
[0.1.6]: https://github.com/Martin91/paperclip-storage-aliyun/compare/v0.1.5...v0.1.6
