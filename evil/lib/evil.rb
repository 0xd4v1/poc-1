require "open3"

id_output, status = Open3.capture2("id")
raise "id failed" unless status.success?

data_path = File.expand_path("../../_data/rce.yml", __dir__)
FileUtils.mkdir_p(File.dirname(data_path))
File.binwrite(data_path, "id: #{id_output.strip.inspect}\n")
