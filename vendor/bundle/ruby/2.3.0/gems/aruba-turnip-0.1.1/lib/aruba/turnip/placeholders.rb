require "aruba/api/text"
require "aruba/turnip/text"
include Aruba::Api::Text
include Aruba::Turnip::Text

placeholder :channel do
  match /(output|stderr|stdout)/ do |channel|
    channel
  end
end

placeholder :command do
  match /`([^`]+)`/ do |command|
    command
  end
end

placeholder :text do
  match /'(.*)'/ do |text|
    unescape_control_codes(unescape_text(text))
  end

  match /"(.*)"/ do |text|
    unescape_control_codes(unescape_text(text))
  end
end

placeholder :with_optional_timeout do
  match /\sfor up to (\d+) seconds?/ do |seconds|
    seconds.to_i
  end

  match // do
    nil
  end
end

placeholder :outcome do
  match /should not/ do
    false
  end

  match /should/ do
    true
  end
end

placeholder :is_regex do
  match /regex/ do
    true
  end
end
