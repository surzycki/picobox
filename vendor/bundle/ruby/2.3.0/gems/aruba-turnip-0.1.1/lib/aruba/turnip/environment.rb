step "a mocked home directory" do
  set_environment_variable 'HOME', expand_path('.')
end

step "I set the environment variable \":variable\" to \":value\"" do |variable, value|
  set_environment_variable(variable.to_s, value.to_s)
end

step "I append \":value\" to the environment variable \"(.*)\"" do |value, variable|
  append_environment_variable(variable.to_s, value.to_s)
end

step "I prepend \"(.*)\" to the environment variable \"(.*)\"" do |value, variable|
  prepend_environment_variable(variable.to_s, value.to_s)
end

step "I set the environment variables? to:" do |table|
  table.hashes.each do |row|
    variable = row['variable'].to_s
    value = row['value'].to_s

    set_environment_variable(variable, value)
  end
end

step "I append the values? to the environment variables?:" do |table|
  table.hashes.each do |row|
    variable = row['variable'].to_s
    value = row['value'].to_s

    append_environment_variable(variable, value)
  end
end

step "I prepend the values? to the environment variables?:" do |table|
  table.hashes.each do |row|
    variable = row['variable'].to_s
    value = row['value'].to_s

    prepend_environment_variable(variable, value)
  end
end
