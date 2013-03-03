require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe S3Poller::Poller do

  let(:poller) { S3Poller::Poller.new(AWS_CONFIG) }

  it "should list folders in the bucket" do
    poller.files.inject([]) {|a, f| a << f.key; a}.should == ["subfolder/","subfolder/test.dot"]
  end
  
end
