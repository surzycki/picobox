Given /^I append the current working dir to my path$/ do
  ENV['PATH'] = [ENV['PATH'], '.'].join(File::PATH_SEPARATOR)
end

Then /^the (stdout|stderr) should be empty$/ do |stdout_stderr|
  steps %Q{
    Then the #{stdout_stderr} should contain exactly:
			"""
			"""
  }
end
