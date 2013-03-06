module S3Poller

  class Downloader

    def initialize(local_path)
      @local_path = local_path
    end

    def download(file)
      begin
        $log.info("Downloading: #{file.key}")
        local_file_path = "#{@local_path}#{file.key}"
        dirname = File.dirname(local_file_path)
        FileUtils.mkdir_p(dirname)
        File.open(local_file_path, 'w') do |local_file|
          local_file.write(file.body)
        end
      rescue Exception => e
        $log.error("Failed to download file #{file.key}, #{e.message}")
      end
    end

  end

end