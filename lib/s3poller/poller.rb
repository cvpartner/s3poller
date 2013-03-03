require 'fog'

module S3Poller

  class Poller

    def initialize(aws_config)
      @aws_config = aws_config
      @connection = Fog::Storage.new(@aws_config[:fog])
    end

    def files
      bucket.files
    end

    private

      def bucket
        @connection.directories.get(@aws_config[:bucket])
      end

  end

end