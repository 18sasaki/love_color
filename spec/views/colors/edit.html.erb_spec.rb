require 'spec_helper'

describe "colors/edit" do
  before(:each) do
    @color = assign(:color, stub_model(Color,
      :name => "MyString",
      :view_name => "MyString",
      :rgb => "MyString",
      :sort => 1,
      :deleted => 1
    ))
  end

  it "renders the edit color form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => colors_path(@color), :method => "post" do
      assert_select "input#color_name", :name => "color[name]"
      assert_select "input#color_view_name", :name => "color[view_name]"
      assert_select "input#color_rgb", :name => "color[rgb]"
      assert_select "input#color_sort", :name => "color[sort]"
      assert_select "input#color_deleted", :name => "color[deleted]"
    end
  end
end
