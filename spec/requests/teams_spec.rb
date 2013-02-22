require 'spec_helper'

describe "Teams Page" do

    it "should have text 'teams'" do

      visit '/teams'
      page.should have_content('teams')

    end

  end
