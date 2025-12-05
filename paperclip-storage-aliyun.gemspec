Gem::Specification.new do |s|
  s.name         = 'paperclip-storage-aliyun'
  s.platform     = Gem::Platform::RUBY
  s.require_path = 'lib'
  s.summary      = 'Extend a Aliyun OSS storage for paperclip'
  s.description  = 'Extend a Aliyun OSS storage for paperclip'
  s.version      = '0.2.0'
  s.files        = Dir['lib/**/*.rb']
  s.authors      = ['Martin Hong', 'Aidi Stan']
  s.email        = 'hongzeqin@gmail.com'
  s.homepage     = 'https://github.com/Martin91/paperclip-storage-aliyun'
  s.license      = 'MIT'

  s.required_ruby_version = '>= 2.7.0'

  s.add_runtime_dependency 'kt-paperclip', '>= 3.5.2'
  s.add_runtime_dependency 'rest-client', '>= 2.0.0'
end
