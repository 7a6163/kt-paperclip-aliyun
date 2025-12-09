[![Ruby](https://github.com/7a6163/kt-paperclip-aliyun/actions/workflows/ruby.yml/badge.svg)](https://github.com/7a6163/kt-paperclip-aliyun/actions/workflows/ruby.yml)
[![codecov](https://codecov.io/gh/7a6163/kt-paperclip-aliyun/branch/master/graph/badge.svg)](https://codecov.io/gh/7a6163/kt-paperclip-aliyun)
[![Gem Version](https://badge.fury.io/rb/kt-paperclip-aliyun.svg)](https://badge.fury.io/rb/kt-paperclip-aliyun)

Aliyun Open Storage Service for Paperclip
===
This gem implement the support for [Aliyun open storage service(OSS)](http://oss.aliyun.com) to [Paperclip](https://github.com/thoughtbot/paperclip).

#### Ruby Version Support
- Ruby 2.7+
- Ruby 3.0+
- Ruby 3.1+
- Ruby 3.2+
- Ruby 3.3+

#### Installation
```shell
gem install kt-paperclip-aliyun
```
Or, if you are using a bundler, you can append the following line into your **Gemfile**:
```ruby
gem 'kt-paperclip-aliyun'
```

#### Configuration
In order to make all the things work, you should do some important configurations through a initializer:

If you are developing a Rails application, you can append a new initializer like:
```ruby
# [rails_root]/config/initializers/paperclip-aliyun-configuration.rb
Paperclip::Attachment.default_options[:aliyun] = {
  access_id: '3VL9XMho8iCushj8',
  access_key: 'VAUI2q7Tc6yTh1jr3kBsEUzZ84gEa2',
  bucket: 'xx-test',
  data_center: 'cn-hangzhou',
  internal: false,
  protocol: 'https',
  protocol_relative_url: false
}
```

Then, in the model which defines the attachment, specify your storage and other options, for example:
```ruby
# [rails_root]/app/models/image.rb
class Image < ActiveRecord::Base
  has_attached_file :attachment, {
    storage: :aliyun,
    styles: { thumbnail: "60x60#"},
    path: 'public/system/:class/:attachment/:id_partition/:style/:filename',
    url: ':aliyun_upload_url'
  }
end
```

Similar to Paperclip::Storage::S3, there are four options for the url by now:
- `:aliyun_upload_url` : the url based on the options you give
- `:aliyun_internal_url` : the internal url, no matter what `options[:aliyun][:internal]` is
- `:aliyun_external_url` : the external url, no matter what `options[:aliyun][:internal]` is
- `:aliyun_alias_url` : the alias url based on the `host_alias` you give, typically used together with CDN

Please note the values above are all strings, not symbols. You could still make your own url if only you know what you are doing.

#### Data Centers
A list of available regions can be found at [https://intl.aliyun.com/help/doc-detail/31837.htm](https://intl.aliyun.com/help/doc-detail/31837.htm).
You can use the "Region Expression" column value as it is for the data center, or you can remove the "oss-" prefix. For example: `oss-cn-hangzhou` and `cn-hangzhou` are both valid options.

#### Development & Testing

Run tests with:
```shell
bundle exec rspec
```

By default, tests run with mocked Aliyun OSS requests (using WebMock). No real credentials are required.

If you want to run tests against real Aliyun OSS:
```shell
export OSS_ACCESS_ID='your_access_key_id'
export OSS_ACCESS_KEY='your_access_key_secret'
bundle exec rspec
```

#### Contributing

1. Fork the repository
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Make your changes and add tests
4. Run the test suite (`bundle exec rspec`)
5. Commit your changes (`git commit -am 'Add some feature'`)
6. Push to the branch (`git push origin my-new-feature`)
7. Create a Pull Request
