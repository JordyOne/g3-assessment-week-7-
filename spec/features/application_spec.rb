require 'spec_helper'

feature 'Homepage' do
  scenario 'Shows the welcome message' do
    visit '/'

    expect(page).to have_content 'Welcome!'
    expect(page).to have_content 'Name'
    expect(page).to have_content 'Message'
  end

  scenarion 'message gets redisplayed' do
    visit '/'

    fill_in
  end
end


# As a visitor
# When I go to the home page
# I see
# * a name text field
# * a message text field
# * a submit button that says "Add Message"
#
# When I click the button, I see my message appear beneath the
# message box.  It shows my message and my name.