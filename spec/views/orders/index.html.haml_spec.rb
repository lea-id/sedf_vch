require 'spec_helper'

describe "orders/index" do
  before(:each) do
    assign(:orders, [
      stub_model(Order,
        :year_at => 1,
        :serial_no => 2,
        :someone => "Someone",
        :description => "Description",
        :copy_count => 3,
        :attach => "Attach"
      ),
      stub_model(Order,
        :year_at => 1,
        :serial_no => 2,
        :someone => "Someone",
        :description => "Description",
        :copy_count => 3,
        :attach => "Attach"
      )
    ])
  end

  it "renders a list of orders" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => "Someone".to_s, :count => 2
    assert_select "tr>td", :text => "Description".to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
    assert_select "tr>td", :text => "Attach".to_s, :count => 2
  end
end
