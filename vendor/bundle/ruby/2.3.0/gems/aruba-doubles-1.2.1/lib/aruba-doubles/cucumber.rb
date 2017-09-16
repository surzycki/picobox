require 'aruba-doubles'

World(ArubaDoubles)

Before do
  ArubaDoubles::Double.setup
end

After do
  ArubaDoubles::Double.teardown
  history.clear
end

Given /^I double `([^`]*)`$/ do |cmd|
  double_cmd(cmd)
end

Given /^I double `([^`]*)` with "([^"]*)"$/ do |cmd, stdout|
  double_cmd(cmd, :puts => stdout)
end

Given /^I double `([^`]*)` with stdout:$/ do |cmd, stdout|
  double_cmd(cmd, :puts => stdout)
end

Given /^I double `([^`]*)` with exit status (\d+) and stdout:$/ do |cmd, exit_status, stdout|
  double_cmd(cmd, :puts => stdout, :exit => exit_status.to_i)
end

Given /^I double `([^`]*)` with stderr:$/ do |cmd, stderr|
  double_cmd(cmd, :warn => stderr)
end

Given /^I double `([^`]*)` with exit status (\d+) and stderr:$/ do |cmd, exit_status, stderr|
  double_cmd(cmd, :warn => stderr, :exit => exit_status.to_i)
end

Given /^I double `([^`]*)` with exit status (\d+)$/ do |cmd, exit_status|
  double_cmd(cmd, :exit => exit_status.to_i)
end

Then /^the double `([^`]*)` should have been run$/ do |cmd|
  history.should include(cmd.shellsplit),
    "expected the doubles history to include `#{cmd}`:\n#{history.to_pretty}"
end

Then /^the double `([^`]*)` should not have been run$/ do |cmd|
  history.should_not include(cmd.shellsplit),
    "expected the doubles history to not include `#{cmd}`:\n#{history.to_pretty}"
end
