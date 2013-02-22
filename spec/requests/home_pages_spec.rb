require 'spec_helper'

describe "Homepage" do

  it "should have the h2 'Upcoming Hack Events'" do
    visit '/'
    page.should have_selector('h2', text: 'Upcoming Hack Events')
  end

  it "should have text 'Murray Rowan'" do
      visit '/'
      page.should have_content('Murray Rowan')
      
  end

  it "should have the title 'Hack Tools | Hackers'" do
      visit '/'
      page.should have_selector('title',
      :text => "Hack Tools | Hackers")
  end

end
