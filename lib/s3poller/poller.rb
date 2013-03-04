require 'fog'
require 's3etag'

module S3Poller

  class Poller

    def initialize(config_path, local_path)
      @local_path = local_path
      @aws_config = YAML::load(File.open(config_path))
    end

    def poll
      files_to_download.each do |file| 
        downloader.download(file)
      end
    end

    private

      def files_to_download
        files.select do |file|
          should_download?(file)
        end
      end

      def files
        bucket.files.inject([]) {|files, file| files << file; files}
      end

      def should_download?(file)
        local_filename = "#{@local_path}#{file.key}"
        return false if local_filename =~ /\/$/
        return false if File.directory?(local_filename)
        return true unless File.exist?(local_filename)
        S3Etag.calc(:file => local_filename) != file.etag
      end

      def downloader
        @downloader ||= Downloader.new(@local_path)
      end

      def bucket
        connection.directories.get(@aws_config[:bucket])
      end

      def connection
        @connection ||= Fog::Storage.new(@aws_config[:fog])
      end

  end

end