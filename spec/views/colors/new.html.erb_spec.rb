require 'spec_helper'

describe "colors/new" do
  before(:each) do
    assign(:color, stub_model(Color,
      :name => "MyString",
      :view_name => "MyString",
      :rgb => "MyString",
      :sort => 1,
      :deleted => 1
    ).as_new_record)
  end

  it "renders new color form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => colors_path, :method => "post" do
      assert_select "input#color_name", :name => "color[name]"
      assert_select "input#color_view_name", :name => "color[view_name]"
      assert_select "input#color_rgb", :name => "color[rgb]"
      assert_select "input#color_sort", :name => "color[sort]"
      assert_select "input#color_deleted", :name => "color[deleted]"
    end
  end
end
