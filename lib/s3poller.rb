require 'logger'

LIBRARY_PATH = File.join(File.dirname(__FILE__), 's3poller')

require File.join(LIBRARY_PATH, 'version') 
require File.join(LIBRARY_PATH, 'poller') 
require File.join(LIBRARY_PATH, 'downloader') 
require File.join(LIBRARY_PATH, 'cli') 

module S3Poller

  $stdout.sync = true

  $log = Logger.new($stdout)
  $log.level = Logger::INFO

end