require 'spec_helper'

describe "hackers/new" do
  before(:each) do
    assign(:hacker, stub_model(Hacker,
      :uname => "MyString",
      :fname => "MyString",
      :lname => "MyString",
      :city => "MyString",
      :country => "MyString",
      :company => "MyString",
      :jobtitle => "MyString",
      :twitter_id => "MyString",
      :facebook_id => "MyString"
    ).as_new_record)
  end

  it "renders new hacker form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => hackers_path, :method => "post" do
      assert_select "input#hacker_uname", :name => "hacker[uname]"
      assert_select "input#hacker_fname", :name => "hacker[fname]"
      assert_select "input#hacker_lname", :name => "hacker[lname]"
      assert_select "input#hacker_city", :name => "hacker[city]"
      assert_select "input#hacker_country", :name => "hacker[country]"
      assert_select "input#hacker_company", :name => "hacker[company]"
      assert_select "input#hacker_jobtitle", :name => "hacker[jobtitle]"
      assert_select "input#hacker_twitter_id", :name => "hacker[twitter_id]"
      assert_select "input#hacker_facebook_id", :name => "hacker[facebook_id]"
    end
  end
end
