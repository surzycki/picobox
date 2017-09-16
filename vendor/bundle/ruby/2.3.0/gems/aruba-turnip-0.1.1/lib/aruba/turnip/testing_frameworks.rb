# Turnip
step "the feature/features :outcome (all) pass" do |expect_success|
  if expect_success
    step 'the output should not contain "(FAILED"'
    step 'the output should not contain "No such step:"'
    step "the exit status should be 0"
  else
    step 'the output should contain "(FAILED"'
    step "the exit status should be 1"
  end
end

# Turnip
step "the feature/features :outcome (all) pass with:" do |expect_success, string|
  if expect_success
    step "the features should pass"
  else
    step "the features should not pass"
  end

  step "the output should contain:", string
end

# Turnip
step "the feature/features :outcome (all) pass with regex:" do |expect_success, string|
  if expect_success
    step "the features should pass"
  else
    step "the features should not pass"
  end

  step "the output should match %r<#{string}>"
end
