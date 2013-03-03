require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe S3Poller::Poller do

  let(:poller) { S3Poller::Poller.new(AWS_CONFIG) }

  it "should list folders in the bucket" do
    poller.files.inject([]) {|a, f| a << f.key; a}.should == ["subfolder/","subfolder/test.txt"]
  end

  it "should have same etag" do
    path = File.expand_path(File.dirname(__FILE__) + '/../documents/subfolder/test.txt')
    poller.files.head("subfolder/test.txt").etag.should == S3Etag.calc(:file => path)
  end

end
