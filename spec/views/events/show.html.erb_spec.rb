require 'spec_helper'

describe "events/show" do
  before(:each) do
    @event = assign(:event, stub_model(Event,
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
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    rendered.should match(/MyText/)
    rendered.should match(/Logo/)
    rendered.should match(/Owner/)
    rendered.should match(/Venue/)
    rendered.should match(/Street Address/)
    rendered.should match(/City/)
    rendered.should match(/Zipcode/)
    rendered.should match(/Email/)
    rendered.should match(/Twitter/)
    rendered.should match(/Facebook/)
    rendered.should match(/Url/)
  end
end
