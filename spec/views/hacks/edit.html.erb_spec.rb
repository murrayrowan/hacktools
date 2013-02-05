require 'spec_helper'

describe "hacks/edit" do
  before(:each) do
    @hack = assign(:hack, stub_model(Hack,
      :name => "MyString",
      :description => "MyString",
      :logo => "MyString"
    ))
  end

  it "renders the edit hack form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => hacks_path(@hack), :method => "post" do
      assert_select "input#hack_name", :name => "hack[name]"
      assert_select "input#hack_description", :name => "hack[description]"
      assert_select "input#hack_logo", :name => "hack[logo]"
    end
  end
end
