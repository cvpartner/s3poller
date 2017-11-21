# encoding: utf-8

require 'thor'

module S3Poller
  class CLI < Thor
    include Thor::Actions


    method_option :config_path, :type => :string,  :required => true, :desc => "Path to fog config i.e. ~/aws.yml"
    method_option :local_path, :type => :string,  :required => true, :desc => "Path to local folder to sync to i.e. ~/localfolder"

    desc 'poll', "Polls S3 once."
    def poll
      s3poller = S3Poller::Poller.new(options[:config_path], options[:local_path])
      while true
        begin
          Timeout::timeout(1800) do
            s3poller.poll
            sleep 1
          end
        rescue Timeout::Error => e
          $log.error("S3 poller did not finish within 30 minutes, #{e.message}")
        end
      end
    end
    
  end

end