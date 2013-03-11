require 'spec_helper'

describe "authentications/new" do
  before(:each) do
    assign(:authentication, stub_model(Authentication,
      :user_id => "MyString",
      :provider => "MyString",
      :uid => "MyString",
      :token => "MyString",
      :token_secret => "MyString"
    ).as_new_record)
  end

  it "renders new authentication form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => authentications_path, :method => "post" do
      assert_select "input#authentication_user_id", :name => "authentication[user_id]"
      assert_select "input#authentication_provider", :name => "authentication[provider]"
      assert_select "input#authentication_uid", :name => "authentication[uid]"
      assert_select "input#authentication_token", :name => "authentication[token]"
      assert_select "input#authentication_token_secret", :name => "authentication[token_secret]"
    end
  end
end
