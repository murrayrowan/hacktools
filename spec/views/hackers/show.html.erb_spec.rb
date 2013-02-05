require 'spec_helper'

describe "hackers/show" do
  before(:each) do
    @hacker = assign(:hacker, stub_model(Hacker,
      :uname => "Uname",
      :fname => "Fname",
      :lname => "Lname",
      :city => "City",
      :country => "Country",
      :company => "Company",
      :jobtitle => "Jobtitle",
      :twitter_id => "Twitter",
      :facebook_id => "Facebook"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Uname/)
    rendered.should match(/Fname/)
    rendered.should match(/Lname/)
    rendered.should match(/City/)
    rendered.should match(/Country/)
    rendered.should match(/Company/)
    rendered.should match(/Jobtitle/)
    rendered.should match(/Twitter/)
    rendered.should match(/Facebook/)
  end
end
