require 'spec_helper'

describe "events/new" do
  before(:each) do
    assign(:event, stub_model(Event,
      :name => "MyString",
      :description => "MyText",
      :logo => "MyString",
      :owner => "MyString",
      :venue => "MyString",
      :street_address => "MyString",
      :city => "MyString",
      :zipcode => "MyString",
      :email => "MyString",
      :twitter_id => "MyString",
      :facebook_id => "MyString",
      :url => "MyString"
    ).as_new_record)
  end

  it "renders new event form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => events_path, :method => "post" do
      assert_select "input#event_name", :name => "event[name]"
      assert_select "textarea#event_description", :name => "event[description]"
      assert_select "input#event_logo", :name => "event[logo]"
      assert_select "input#event_owner", :name => "event[owner]"
      assert_select "input#event_venue", :name => "event[venue]"
      assert_select "input#event_street_address", :name => "event[street_address]"
      assert_select "input#event_city", :name => "event[city]"
      assert_select "input#event_zipcode", :name => "event[zipcode]"
      assert_select "input#event_email", :name => "event[email]"
      assert_select "input#event_twitter_id", :name => "event[twitter_id]"
      assert_select "input#event_facebook_id", :name => "event[facebook_id]"
      assert_select "input#event_url", :name => "event[url]"
    end
  end
end
