require 'spec_helper'

describe "members/edit" do
  before(:each) do
    @member = assign(:member, stub_model(Member,
      :name => "MyString",
      :view_name => "MyString",
      :group_id => 1,
      :color_id => 1,
      :push_flg => 1,
      :center_flg => 1,
      :graduation_flg => 1,
      :deleted => 1
    ))
  end

  it "renders the edit member form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => members_path(@member), :method => "post" do
      assert_select "input#member_name", :name => "member[name]"
      assert_select "input#member_view_name", :name => "member[view_name]"
      assert_select "input#member_group_id", :name => "member[group_id]"
      assert_select "input#member_color_id", :name => "member[color_id]"
      assert_select "input#member_push_flg", :name => "member[push_flg]"
      assert_select "input#member_center_flg", :name => "member[center_flg]"
      assert_select "input#member_graduation_flg", :name => "member[graduation_flg]"
      assert_select "input#member_deleted", :name => "member[deleted]"
    end
  end
end
