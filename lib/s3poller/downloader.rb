module S3Poller

  class Downloader

    def initialize(local_path)
      @local_path = local_path
    end

    def download(file)
      local_file_path = "#{@local_path}#{file.key}"
      dirname = File.dirname(local_file_path)
      FileUtils.mkdir_p(dirname)
      File.open(local_file_path, 'w') do |local_file|
        local_file.write(file.body)
      end
    end

  end

end