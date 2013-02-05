require 'spec_helper'

describe "hacks/show" do
  before(:each) do
    @hack = assign(:hack, stub_model(Hack,
      :name => "Name",
      :description => "Description",
      :logo => "Logo"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    rendered.should match(/Description/)
    rendered.should match(/Logo/)
  end
end
