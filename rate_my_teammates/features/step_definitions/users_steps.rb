
Given /the following users exist/ do |users_table|
  users_table.hashes.each do |user|
    User.create user
  end
end

Given /user "(.*)" has skill "(.*)"/ do |uni, name|
  @user = User.find_by(uni: uni)
  @user.skills.create!(name: name)
end

Given /^(?:|I )log in as "(.+)"$/ do |uni|
  token = Token.create(:login_token => SecureRandom.hex(10),
                       :uni => uni)
  visit auth_path(:token => token.login_token)
end

Given /^(?:|I )just logged in as "(.+)"$/ do |uni|
  token = Token.create(:login_token => SecureRandom.hex(10),
                       :uni => uni, :created_at => Time.now.utc, :updated_at => Time.now.utc)
  token.save
  visit auth_path(:token => token.login_token)
end

Given /^"(.+)" token expired$/ do |uni|
  token = Token.create(:login_token => SecureRandom.hex(10),
                       :uni => uni, :updated_at => Time.now - 3.hours)
end

Given /^"(.+)" logged on for the current session$/ do |uni|
  current_user= User.find_by(uni: uni)
end

Then /I should see "(.*)" before "(.*)"/ do |e1, e2|
  #  ensure that that e1 occurs before e2.
  #  page.body is the entire content of the page as a string.
  expect(page.body.index(e1) < page.body.index(e2))
end

When /I (un)?check the following ratings: (.*)/ do |uncheck, rating_list|
  rating_list.split(', ').each do |rating|
    step %{I #{uncheck.nil? ? '' : 'un'}check "ratings_#{rating}"}
  end
end

Then /I should see all the students/ do
  # Make sure that all the movies in the app are visible in the table
  User.all.each do |user|
    step %{I should see "#{user.uni}"}
  end
end

Then /I should not see all the students/ do
  # Make sure that all the movies in the app are visible in the table
  User.all.each do |user|
    step %{I should not see "#{user.uni}"}
  end
end
