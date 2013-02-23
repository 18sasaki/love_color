require 'spec_helper'

describe "members/index" do
  before(:each) do
    assign(:members, [
      stub_model(Member,
        :name => "Name",
        :view_name => "View Name",
        :group_id => 1,
        :color_id => 2,
        :push_flg => 3,
        :center_flg => 4,
        :graduation_flg => 5,
        :deleted => 6
      ),
      stub_model(Member,
        :name => "Name",
        :view_name => "View Name",
        :group_id => 1,
        :color_id => 2,
        :push_flg => 3,
        :center_flg => 4,
        :graduation_flg => 5,
        :deleted => 6
      )
    ])
  end

  it "renders a list of members" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "View Name".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
    assert_select "tr>td", :text => 4.to_s, :count => 2
    assert_select "tr>td", :text => 5.to_s, :count => 2
    assert_select "tr>td", :text => 6.to_s, :count => 2
  end
end
