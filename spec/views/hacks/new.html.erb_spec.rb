require 'spec_helper'

describe "hacks/new" do
  before(:each) do
    assign(:hack, stub_model(Hack,
      :name => "MyString",
      :description => "MyString",
      :logo => "MyString"
    ).as_new_record)
  end

  it "renders new hack form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => hacks_path, :method => "post" do
      assert_select "input#hack_name", :name => "hack[name]"
      assert_select "input#hack_description", :name => "hack[description]"
      assert_select "input#hack_logo", :name => "hack[logo]"
    end
  end
end
