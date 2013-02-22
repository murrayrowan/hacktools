require 'spec_helper'

describe "Hacks Page" do

    it "should have text 'hacks'" do

      visit '/hacks'
      page.should have_content('hacks')

    end

  end
