require 'spec_helper'

describe "authentications/show" do
  before(:each) do
    @authentication = assign(:authentication, stub_model(Authentication,
      :user_id => "User",
      :provider => "Provider",
      :uid => "Uid",
      :token => "Token",
      :token_secret => "Token Secret"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/User/)
    rendered.should match(/Provider/)
    rendered.should match(/Uid/)
    rendered.should match(/Token/)
    rendered.should match(/Token Secret/)
  end
end
