require 'spec_helper'

describe "hacks/index" do
  before(:each) do
    assign(:hacks, [
      stub_model(Hack,
        :name => "Name",
        :description => "Description",
        :logo => "Logo"
      ),
      stub_model(Hack,
        :name => "Name",
        :description => "Description",
        :logo => "Logo"
      )
    ])
  end

  it "renders a list of hacks" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Description".to_s, :count => 2
    assert_select "tr>td", :text => "Logo".to_s, :count => 2
  end
end
