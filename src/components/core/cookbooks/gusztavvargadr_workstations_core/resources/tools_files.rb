property :tools_files_options, Hash

default_action :create

action :create do
  return if new_resource.tools_files_options.nil?

  new_resource.tools_files_options.each do |source_file, target_file|
    target_directory = ::File.dirname(target_file)

    directory target_directory do
      recursive true
      action :create
    end

    remote_file target_file do
      source source_file
      action :create
    end
  end
end
