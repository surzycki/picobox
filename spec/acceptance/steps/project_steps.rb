module ProjectSteps
  step 'the project is uninitialized' do
    send '(a/the) (file/directory) (named) ":name" does not exist', '.picobox'
    send '(a/the) (file/directory) (named) ":name" does not exist', 'docker-compose.yml'
    send '(a/the) (file/directory) (named) ":name" does not exist', 'Dockerfile'
  end
end

RSpec.configure do |config|
  config.include ProjectSteps
end