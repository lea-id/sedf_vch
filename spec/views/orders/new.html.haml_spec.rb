require 'spec_helper'

describe "orders/new" do
  before(:each) do
    assign(:order, stub_model(Order,
      :year_at => 1,
      :serial_no => 1,
      :someone => "MyString",
      :description => "MyString",
      :copy_count => 1,
      :attach => "MyString"
    ).as_new_record)
  end

  it "renders new order form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => orders_path, :method => "post" do
      assert_select "input#order_year_at", :name => "order[year_at]"
      assert_select "input#order_serial_no", :name => "order[serial_no]"
      assert_select "input#order_someone", :name => "order[someone]"
      assert_select "input#order_description", :name => "order[description]"
      assert_select "input#order_copy_count", :name => "order[copy_count]"
      assert_select "input#order_attach", :name => "order[attach]"
    end
  end
end
