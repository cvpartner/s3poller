require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe S3Poller::Poller do

  let(:local_path) { "#{File.expand_path(File.dirname(__FILE__) + '/../documents')}/" }
  let(:local_tmp_path) { "#{File.expand_path(File.dirname(__FILE__) + '/../tmp')}/" }
  let(:poller) { S3Poller::Poller.new(AWS_CONFIG, local_path) }
  let(:tmp_poller) { S3Poller::Poller.new(AWS_CONFIG, local_tmp_path) }
  let(:downloader) { S3Poller::Downloader.new(local_tmp_path) }

  it "should include changed files" do 
    poller.files_to_download.first.key.should == "subfolder/changed.txt"
  end

  it "should include new files"  do
    poller.files_to_download.last.key.should == "subfolder/new.txt"
  end

  it "should download the files" do
    FileUtils.remove_dir("#{local_tmp_path}subfolder", true)
    file = tmp_poller.files_to_download.first
    downloader.download(file)
    File.exists?("#{local_tmp_path}subfolder/changed.txt").should == true
  end

end
