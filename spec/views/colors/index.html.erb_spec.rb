require 'spec_helper'

describe "colors/index" do
  before(:each) do
    assign(:colors, [
      stub_model(Color,
        :name => "Name",
        :view_name => "View Name",
        :rgb => "Rgb",
        :sort => 1,
        :deleted => 2
      ),
      stub_model(Color,
        :name => "Name",
        :view_name => "View Name",
        :rgb => "Rgb",
        :sort => 1,
        :deleted => 2
      )
    ])
  end

  it "renders a list of colors" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "View Name".to_s, :count => 2
    assert_select "tr>td", :text => "Rgb".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
  end
end
