# Vlad Version

Vlad tasks for creating a version file and version tag upon deploy so it’s
seamless and easy to keep track of what is deployed where.

## Installation

Add this line to your application's Gemfile:

    gem 'vlad-version', :require => false

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install vlad-version

## Usage

Then add to your `config/deploy.rb`:

    require 'vlad/version'

Two tasks are provided that you can add into your existing deploy task(s):

- `vlad:version:file` which creates a file in
  `#{shared_path}/#{version_file_path}` with the date of the deploy and the Git
  revision deployed.
- `vlad:version:tag` which creates a Git tag with the name
  `#{environment}_#{release_time}` containing the environment deployed to, time
  of deploy, and who deployed.

The following variables are available:

<table>
  <thead>
    <tr>
      <th>Variable</th>
      <th>Default value</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td><code>release_time</code></td>
      <td><code>Time.now.utc</code></td>
    </tr>
    <tr>
      <td><code>sign_version_tag</code></td>
      <td><code>false</code></td>
    </tr>
    <tr>
      <td><code>version_file_path</code></td>
      <td><code>"/system/version.txt"</code></td>
    </tr>
  </tbody>
</table>

In order to ensure `release_time` is consistent with Vlad’s `release_name`,
`release_name` is set to `release_time.strftime('%Y%m%d%H%M%S')`, which
maintains the same format as Vlad’s default. If you override `release_name` to
another time-based format, you should use `release_time` as your source time to maintain consistency.

If the `environment` variable is set in your deploy configuration, it will be prefixed onto the Git tag name.

## Contributing

Contributions are welcome. Please be sure that your pull requests are atomic
so they can be considered and accepted separately.

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

## Credits & License

Copyright © 2012 J. Andrew Marshall. All rights reserved.
License is available in the LICENSE file.
