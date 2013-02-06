require 'spec_helper'

describe "events/index" do
  before(:each) do
    assign(:events, [
      stub_model(Event,
        :name => "Name",
        :description => "MyText",
        :logo => "Logo",
        :owner => "Owner",
        :venue => "Venue",
        :street_address => "Street Address",
        :city => "City",
        :zipcode => "Zipcode",
        :email => "Email",
        :twitter_id => "Twitter",
        :facebook_id => "Facebook",
        :url => "Url"
      ),
      stub_model(Event,
        :name => "Name",
        :description => "MyText",
        :logo => "Logo",
        :owner => "Owner",
        :venue => "Venue",
        :street_address => "Street Address",
        :city => "City",
        :zipcode => "Zipcode",
        :email => "Email",
        :twitter_id => "Twitter",
        :facebook_id => "Facebook",
        :url => "Url"
      )
    ])
  end

  it "renders a list of events" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "Logo".to_s, :count => 2
    assert_select "tr>td", :text => "Owner".to_s, :count => 2
    assert_select "tr>td", :text => "Venue".to_s, :count => 2
    assert_select "tr>td", :text => "Street Address".to_s, :count => 2
    assert_select "tr>td", :text => "City".to_s, :count => 2
    assert_select "tr>td", :text => "Zipcode".to_s, :count => 2
    assert_select "tr>td", :text => "Email".to_s, :count => 2
    assert_select "tr>td", :text => "Twitter".to_s, :count => 2
    assert_select "tr>td", :text => "Facebook".to_s, :count => 2
    assert_select "tr>td", :text => "Url".to_s, :count => 2
  end
end
