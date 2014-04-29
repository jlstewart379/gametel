Given(/^I am on the home screen$/) do
   on(HomeScreen).app_title_view.shown?
end

Then(/^I can see the text "([^"]*)"$/) do |text|
  on(HomeScreen).app_title.should.eql?(text)
end

And(/^I enter "([^"]*)" into the field marked "([^"]*)"$/) do |text, which|
  on(HomeScreen).send("view_#{which}=", text)
end

When(/^I press the button marked "([^"]*)"$/) do |which|
  on(HomeScreen).send("button_#{which}")
end

Then(/^I am on the button screen$/) do
  on(ButtonScreen).active?.should be_true
end