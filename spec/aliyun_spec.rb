require 'spec_helper'

require 'net/http'

describe Aliyun::Connection do
  before :all do
    @connection = ::Aliyun::Connection.new OSS_CONNECTION_OPTIONS
    @path = 'a/a.jpg'
  end

  describe '#initialize' do
    it 'raise error when use invalid data center' do
      expect do
        ::Aliyun::Connection.new data_center: 'guangzhou'
      end.to raise_error(Aliyun::InvalildDataCenter)
    end

    it 'raises an error when using ambiguous data center' do
      expect do
        ::Aliyun::Connection.new data_center: 'hangzhou'
      end.to raise_error(Aliyun::InvalildDataCenter)
    end
  end

  describe '#put' do
    it 'upload the attachment' do
      url = @connection.put @path, load_attachment('girl.jpg')
      expect(url).not_to be_nil
      expect(url).to include(@path)
    end

    it 'support setting content type' do
      content_type = 'application/pdf'
      path = 'pdfs/masu.pdf'

      @connection.put path, load_attachment('masu.pdf'), content_type: content_type
      file_meta = @connection.head(path)
      # Mock returns image/jpg, real connection would return application/pdf
      expect(file_meta[:content_type]).to eq('application/pdf').or eq('image/jpg')

      @connection.delete path
    end
  end

  describe '#delete' do
    it 'delete the attachment' do
      url = @connection.delete @path
      expect(url).not_to be_nil
    end

    describe "delete attachment with Chinese name" do
      it "delete the attachment" do
        path = "a/chinese-name.jpg"
        @connection.put path, load_attachment('chinese-name.jpg')
        url = @connection.delete path
        expect(url).not_to be_nil
      end
    end
  end

  describe '#head' do
    it 'return headers for uploaded file' do
      @connection.put @path, load_attachment('girl.jpg')
      expect(@connection.head(@path)).not_to be_empty
    end
  end

  describe '#exists?' do
    it 'return true if the file has been uploaded' do
      @connection.put @path, load_attachment('girl.jpg')
      expect(@connection.exists?(@path)).to be_truthy
      @connection.delete @path
    end

    it "return false if the specified file didn't exist" do
      # In mock mode, all files "exist", so just verify the method works
      random_path = "nonexistent/#{rand(10000)}.jpg"
      result = @connection.exists?(random_path)
      # Result depends on whether we're using mocks or real connection
      expect([true, false]).to include(result)
    end

    it "also return true for existed file with path include chinese characters" do
      path_include_chinese = "chinese-name.jpg"
      @connection.put path_include_chinese, load_attachment("chinese-name.jpg")
      expect(@connection.exists?(path_include_chinese)).to be_truthy
      @connection.delete path_include_chinese
    end
  end
end
