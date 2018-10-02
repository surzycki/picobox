module CliSteps
  step 'I am in a project directory called :name' do |name|
    create_directory name
    cd name
  end

  step 'the test environment is setup' do
    send 'a mocked home directory'

    # stub tmp dir
    create_directory 'tmp'
    allow(Picobox::Os::CurrentOs.get).
      to receive(:tmp_dir).
      and_return("#{Picobox.root}/#{Aruba.config.working_directory}/tmp")

    # place tar from fixtures (like it was downloaded but it wasn't)
    allow_any_instance_of(Picobox::Utils::Packages).
      to receive(:download).
      and_return("#{Picobox.root}/#{Aruba.config.working_directory}/tmp/packages_v0.1.tar")

    copy '%/packages_v0.1.tar', 'tmp/packages_v0.1.tar'

    # stub packages directory
    #allow(Picobox).
    #  to receive(:packages_dir).
    #  and_return("#{Picobox.root}/#{Aruba.config.working_directory}/packages")
  end

  step 'picobox can be installed' do
    send 'docker is installed'

    stub_request(:any, Picobox::PACKAGES_INFO_URL).
      to_return(body: package_info_url_response, status: 200)

    stub_request(:any, 'https://api.github.com/repos/picobox/packages/tarball/v0.1').
      to_return(body: '', status: 200)
  end

  step 'picobox has been installed' do
    send 'picobox can be installed'

    run_simple('picobox install', fail_on_error: false)

    send 'I copy (a/the) directory from ":source" to ":destination"', 'packages/boxes', 'packages'
    send 'I copy (a/the) directory from ":source" to ":destination"', 'packages/services', 'packages'
    send 'I copy (a/the) directory from ":source" to ":destination"', 'packages/shell', 'packages'
  end

  def package_info_url_response
    '{
      "url": "https://api.github.com/repos/picobox/packages/releases/7864837",
      "assets_url": "https://api.github.com/repos/picobox/packages/releases/7864837/assets",
      "upload_url": "https://uploads.github.com/repos/picobox/packages/releases/7864837/assets{?name,label}",
      "html_url": "https://github.com/picobox/packages/releases/tag/v0.1",
      "id": 7864837,
      "tag_name": "v0.1",
      "target_commitish": "master",
      "name": "All base packages",
      "draft": false,
      "author": {
        "login": "picobox",
        "id": 31483256,
        "avatar_url": "https://avatars3.githubusercontent.com/u/31483256?v=4",
        "gravatar_id": "",
        "url": "https://api.github.com/users/picobox",
        "html_url": "https://github.com/picobox",
        "followers_url": "https://api.github.com/users/picobox/followers",
        "following_url": "https://api.github.com/users/picobox/following{/other_user}",
        "gists_url": "https://api.github.com/users/picobox/gists{/gist_id}",
        "starred_url": "https://api.github.com/users/picobox/starred{/owner}{/repo}",
        "subscriptions_url": "https://api.github.com/users/picobox/subscriptions",
        "organizations_url": "https://api.github.com/users/picobox/orgs",
        "repos_url": "https://api.github.com/users/picobox/repos",
        "events_url": "https://api.github.com/users/picobox/events{/privacy}",
        "received_events_url": "https://api.github.com/users/picobox/received_events",
        "type": "User",
        "site_admin": false
      },
      "prerelease": false,
      "created_at": "2017-09-23T14:13:18Z",
      "published_at": "2017-09-23T14:15:14Z",
      "assets": [

      ],
      "tarball_url": "https://api.github.com/repos/picobox/packages/tarball/v0.1",
      "zipball_url": "https://api.github.com/repos/picobox/packages/zipball/v0.1",
      "body": "Base packages for picobox"
    }'
  end
end


RSpec.configure do |config|
  config.include CliSteps
end
