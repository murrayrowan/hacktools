require 'spec_helper'

describe "hackers/index" do
  before(:each) do
    assign(:hackers, [
      stub_model(Hacker,
        :uname => "Uname",
        :fname => "Fname",
        :lname => "Lname",
        :city => "City",
        :country => "Country",
        :company => "Company",
        :jobtitle => "Jobtitle",
        :twitter_id => "Twitter",
        :facebook_id => "Facebook"
      ),
      stub_model(Hacker,
        :uname => "Uname",
        :fname => "Fname",
        :lname => "Lname",
        :city => "City",
        :country => "Country",
        :company => "Company",
        :jobtitle => "Jobtitle",
        :twitter_id => "Twitter",
        :facebook_id => "Facebook"
      )
    ])
  end

  it "renders a list of hackers" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Uname".to_s, :count => 2
    assert_select "tr>td", :text => "Fname".to_s, :count => 2
    assert_select "tr>td", :text => "Lname".to_s, :count => 2
    assert_select "tr>td", :text => "City".to_s, :count => 2
    assert_select "tr>td", :text => "Country".to_s, :count => 2
    assert_select "tr>td", :text => "Company".to_s, :count => 2
    assert_select "tr>td", :text => "Jobtitle".to_s, :count => 2
    assert_select "tr>td", :text => "Twitter".to_s, :count => 2
    assert_select "tr>td", :text => "Facebook".to_s, :count => 2
  end
end
