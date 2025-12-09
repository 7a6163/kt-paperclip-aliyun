Gem::Specification.new do |s|
  s.name         = 'kt-paperclip-aliyun'
  s.platform     = Gem::Platform::RUBY
  s.require_path = 'lib'
  s.summary      = 'Aliyun OSS storage adapter for kt-paperclip'
  s.description  = 'Provides Aliyun OSS (Object Storage Service) storage backend for kt-paperclip gem'
  s.version      = '1.0.0'
  s.files        = Dir['lib/**/*.rb', 'README.md', 'CHANGELOG.md', 'LICENSE']
  s.authors      = ['Martin Hong', 'Aidi Stan', '7a6163']
  s.email        = 'hongzeqin@gmail.com'
  s.homepage     = 'https://github.com/7a6163/kt-paperclip-aliyun'
  s.license      = 'MIT'
  s.metadata     = {
    'bug_tracker_uri' => 'https://github.com/7a6163/kt-paperclip-aliyun/issues',
    'changelog_uri' => 'https://github.com/7a6163/kt-paperclip-aliyun/blob/master/CHANGELOG.md',
    'source_code_uri' => 'https://github.com/7a6163/kt-paperclip-aliyun'
  }

  s.required_ruby_version = '>= 2.7.0'

  s.add_runtime_dependency 'kt-paperclip', '>= 3.5.2'
  s.add_runtime_dependency 'rest-client', '>= 2.0.0'
end
