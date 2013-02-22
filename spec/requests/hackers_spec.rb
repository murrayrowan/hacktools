require 'spec_helper'

describe "Hackers Page" do

    it "should have text 'hackers'" do

      visit '/hackers'
      page.should have_content('hackers')

    end

  end
