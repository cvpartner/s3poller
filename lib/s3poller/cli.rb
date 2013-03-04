# encoding: utf-8

require 'thor'

module S3Poller
  class CLI < Thor
    include Thor::Actions


    method_option :config_path, :type => :string,  :required => true, :desc => "Path to fog config i.e. ~/aws.yml"
    method_option :local_path, :type => :string,  :required => true, :desc => "Path to local folder to sync to i.e. ~/localfolder"

    desc 'poll', "Polls S3 once."
    def poll
      S3Poller::Poller.new(options[:config_path], options[:local_path]).poll
    end
  end

end