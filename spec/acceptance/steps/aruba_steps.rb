module ArubaSteps
  step '(a/the) file (named) ":file" :outcome match:' do |file, expect_success, expected|
    if expect_success
      expect(file).to have_file_content file_content_matching(expected)
    else
      expect(file).not_to have_file_content file_content_matching(expected)
    end
  end

  step '(a/the) (file/directory) (named) ":name" does not exist' do |name|
    remove(name, :force => true)
  end
end

RSpec.configure do |config|
  config.include ArubaSteps
end