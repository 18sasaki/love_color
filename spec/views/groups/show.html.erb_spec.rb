require 'spec_helper'

describe "groups/show" do
  before(:each) do
    @group = assign(:group, stub_model(Group,
      :name => "Name",
      :view_name => "View Name",
      :sort => 1,
      :deleted => 2
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    rendered.should match(/View Name/)
    rendered.should match(/1/)
    rendered.should match(/2/)
  end
end
