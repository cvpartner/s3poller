# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 's3poller/version'

Gem::Specification.new do |s|
  s.name = "s3poller"
  s.version = S3poller::VERSION
  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Erling Wegger Linde"]
  s.date = "2013-03-06"
  s.description = "Poll and download from S3 to local folder. More info coming.."
  s.email = "erlingwl@gmail.com"
  s.executables = ["s3poller"]
  s.extra_rdoc_files = [
    "LICENSE.txt",
    "README.rdoc"
  ]
  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.homepage = "http://github.com/erlingwl/s3poller"
  s.licenses = ["MIT"]
  s.require_paths = ["lib"]
  s.summary = "Poll and download from S3 to local folder"
end