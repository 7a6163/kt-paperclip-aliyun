require 'simplecov'
SimpleCov.start do
  add_filter '/spec/'
  add_filter '/vendor/'
end

if ENV['CI']
  require 'codecov'
  SimpleCov.formatter = SimpleCov::Formatter::Codecov
end

require 'pry'
require 'pry-nav'
require 'kt-paperclip-aliyun'

Paperclip.logger.level = ::Logger::UNKNOWN
Dir[Bundler.root.join('spec/support/**/*.rb')].each(&method(:require))

# Aliyun defaults
# Use mock credentials if real ones are not provided
OSS_CONNECTION_OPTIONS = {
  access_id: ENV['OSS_ACCESS_ID'] || 'test_access_id',
  access_key: ENV['OSS_ACCESS_KEY'] || 'test_access_key',
  bucket: 'martin-test',
  data_center: 'cn-hangzhou',
  internal: false,
  host_alias: 'hackerpie.com'
}

# Only use WebMock if no real credentials are provided
unless ENV['OSS_ACCESS_ID'] && ENV['OSS_ACCESS_KEY']
  require 'webmock/rspec'

  WebMock.disable_net_connect!(allow_localhost: true)

  RSpec.configure do |config|
    config.before(:each) do
      oss_host = "#{OSS_CONNECTION_OPTIONS[:bucket]}.oss-#{OSS_CONNECTION_OPTIONS[:data_center]}.aliyuncs.com"

      # Mock all HTTP requests to Aliyun OSS
      stub_request(:put, %r{http://#{oss_host}/.*}).
        with(headers: { 'Authorization' => /^OSS / }).
        to_return(status: 200, body: '', headers: {})

      stub_request(:head, %r{http://#{oss_host}/.*}).
        with(headers: { 'Authorization' => /^OSS / }).
        to_return(
          status: 200,
          headers: {
            'content-type' => 'image/jpg',
            'content-length' => '125198',
            'etag' => '"336262A42E5B99AFF5B8BC66611FC156"',
            'last-modified' => 'Sun, 01 Dec 2013 16:39:57 GMT'
          }
        )

      stub_request(:get, %r{http://#{oss_host}/.*}).
        with(headers: { 'Authorization' => /^OSS / }).
        to_return(status: 200, body: 'mock file content', headers: { 'content-type' => 'image/jpg' })

      stub_request(:delete, %r{http://#{oss_host}/.*}).
        with(headers: { 'Authorization' => /^OSS / }).
        to_return(status: 204, body: '', headers: {})
    end
  end
end

# Paperclip defaults
Paperclip::Attachment.default_options[:storage] = :aliyun
Paperclip::Attachment.default_options[:aliyun] = OSS_CONNECTION_OPTIONS
Paperclip::Attachment.default_options[:path] = 'public/system/:class/:attachment/:id_partition/:style/:filename'
Paperclip::Attachment.default_options[:url] = ':aliyun_upload_url'

# Utility methods
def load_attachment(file_name)
  File.open(Bundler.root.join("spec/attachments/#{file_name}"), 'rb')
end
