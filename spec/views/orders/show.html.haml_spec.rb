require 'spec_helper'

describe "orders/show" do
  before(:each) do
    @order = assign(:order, stub_model(Order,
      :year_at => 1,
      :serial_no => 2,
      :someone => "Someone",
      :description => "Description",
      :copy_count => 3,
      :attach => "Attach"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    rendered.should match(/2/)
    rendered.should match(/Someone/)
    rendered.should match(/Description/)
    rendered.should match(/3/)
    rendered.should match(/Attach/)
  end
end
