require 'spec_helper'

describe "authentications/index" do
  before(:each) do
    assign(:authentications, [
      stub_model(Authentication,
        :user_id => "User",
        :provider => "Provider",
        :uid => "Uid",
        :token => "Token",
        :token_secret => "Token Secret"
      ),
      stub_model(Authentication,
        :user_id => "User",
        :provider => "Provider",
        :uid => "Uid",
        :token => "Token",
        :token_secret => "Token Secret"
      )
    ])
  end

  it "renders a list of authentications" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "User".to_s, :count => 2
    assert_select "tr>td", :text => "Provider".to_s, :count => 2
    assert_select "tr>td", :text => "Uid".to_s, :count => 2
    assert_select "tr>td", :text => "Token".to_s, :count => 2
    assert_select "tr>td", :text => "Token Secret".to_s, :count => 2
  end
end
