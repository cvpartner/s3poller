require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe S3Poller::Poller do

  let(:local_path) { "#{File.expand_path(File.dirname(__FILE__) + '/../documents')}/" }
  let(:poller) { S3Poller::Poller.new(AWS_CONFIG, local_path) }

  it "should include changed files" do 
    poller.files_to_download.first.key.should == "subfolder/changed.txt"
  end

  it "should include new files"  do
    poller.files_to_download.last.key.should == "subfolder/new.txt"
  end

end
