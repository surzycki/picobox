RSpec.configure do |config|
  config.before(type: :feature) do
    FileUtils::mkdir_p 'tmp/aruba'
  end

  config.after(type: :feature) do
    FileUtils.remove_dir('tmp/aruba')
  end
end