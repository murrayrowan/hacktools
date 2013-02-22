require 'spec_helper'

describe "Event Page" do

    it "should have text 'Name'" do

      visit '/events/2'
      page.should have_content('Name')
      
    end
end

describe "Event Hacks Page" do

    it "should have text 'hacks'" do

      visit '/events/1/hacks'
      page.should have_content('hacks')

    end
end

describe "Event Hackes Page" do

    it "should have text 'hackers'" do

      visit '/events/1/hackers'
      page.should have_content('hackers')

    end
end

describe "Event Teams Page" do

    it "should have text 'teams'" do

      visit '/events/1/teams'
      page.should have_content('teams')

    end
end

