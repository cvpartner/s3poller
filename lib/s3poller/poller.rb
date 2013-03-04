require 'fog'
require 's3etag'

module S3Poller

  class Poller

    def initialize(aws_config, local_path)
      @local_path = local_path
      @aws_config = aws_config
    end

    def files_to_download
      bucket.files.select do |file|
        should_download?(file)
      end
    end

    private

      def should_download?(file)
        local_filename = "#{@local_path}#{file.key}"
        return false if local_filename =~ /\/$/
        return false if File.directory?(local_filename)
        return true unless File.exist?(local_filename)
        S3Etag.calc(:file => local_filename) != file.etag
      end

      def bucket
        connection.directories.get(@aws_config[:bucket])
      end

      def connection
        @connection ||= Fog::Storage.new(@aws_config[:fog])
      end

  end

end