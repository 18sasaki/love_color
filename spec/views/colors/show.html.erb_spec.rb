require 'spec_helper'

describe "colors/show" do
  before(:each) do
    @color = assign(:color, stub_model(Color,
      :name => "Name",
      :view_name => "View Name",
      :rgb => "Rgb",
      :sort => 1,
      :deleted => 2
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    rendered.should match(/View Name/)
    rendered.should match(/Rgb/)
    rendered.should match(/1/)
    rendered.should match(/2/)
  end
end
