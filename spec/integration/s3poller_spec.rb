require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe S3Poller::Poller do

  let(:local_tmp_path) { "#{File.expand_path(File.dirname(__FILE__) + '/../tmp')}/" }
  let(:tmp_poller) { S3Poller::Poller.new(AWS_CONFIG, local_tmp_path) }

  it "should download the files" do
    FileUtils.remove_dir("#{local_tmp_path}subfolder", true)
    tmp_poller.poll
    File.exists?("#{local_tmp_path}subfolder/changed.txt").should == true
    File.exists?("#{local_tmp_path}subfolder/new.txt").should == true
    File.exists?("#{local_tmp_path}subfolder/test.txt").should == true
  end

end
