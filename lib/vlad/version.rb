set :release_time, Time.now.utc
set :sign_version_tag, false
set :version_file_path, '/system/version.txt'

set :release_name, release_time.strftime('%Y%m%d%H%M%S')
set :shared_paths, { 'system' => 'public/system' }.merge(shared_paths)

namespace :vlad do
  namespace :version do
    remote_task :file, roles: :app do
      commit_cmd = "cd #{scm_path}/repo && git rev-parse HEAD"
      run "echo '#{release_time.iso8601}': $(#{commit_cmd}) > #{shared_path}/#{version_file_path}"
    end

    task :tag do
      defined? environment or environment = nil
      time_str = release_time.iso8601.tr(':', '-')
      tag_name = [environment, time_str].compact.join('_')
      tag_message = [
        'Tag auto-generated on deploy. About this deploy:',
        "Environment: #{environment}",
        "Time: #{time_str}",
        "Deployer: #{`whoami`.strip}@#{`hostname`.strip}"
      ].join("\n")

      system ['git tag',
              ('-s' if sign_version_tag),
              "-m '#{tag_message}'",
              tag_name,
              revision,
              '&& git push --tags'].compact.join(' ')
    end
  end
end
