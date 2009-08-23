Given /^I am logged in as "([^\"]*)"$/ do |url|
  visit root_path
  click_link "Login"
  fill_in "login_openid", url
  click_button "Login"
end
