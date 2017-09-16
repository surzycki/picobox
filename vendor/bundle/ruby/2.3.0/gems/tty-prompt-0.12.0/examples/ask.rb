# encoding: utf-8

require 'tty-prompt'

prompt = TTY::Prompt.new

prompt.ask('What is your name?', default: ENV['USER'])

prompt.ask('Folder name?') do |q|
  q.required(true)
  q.validate ->(v) { return !Dir.exist?(v) }
  q.messages[:valid?] = 'Folder already exists?'
  q.messages[:required?] = 'Folder name must not be empty'
end

