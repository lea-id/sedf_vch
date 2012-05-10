require 'spec_helper'

describe "incomings/new" do
  before(:each) do
    assign(:incoming, stub_model(Incoming,
      :user_id => 1,
      :serial_no1 => 1,
      :doc_no => "MyString",
      :address => "MyString",
      :description => "MyString",
      :copy_count => 1,
      :copy_no => 1,
      :pages => 1,
      :serial_no2 => "MyString",
      :in_out_no => 1,
      :delo_no => 1,
      :delo_pages => "MyString"
    ).as_new_record)
  end

  it "renders new incoming form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => incomings_path, :method => "post" do
      assert_select "input#incoming_user_id", :name => "incoming[user_id]"
      assert_select "input#incoming_serial_no1", :name => "incoming[serial_no1]"
      assert_select "input#incoming_doc_no", :name => "incoming[doc_no]"
      assert_select "input#incoming_address", :name => "incoming[address]"
      assert_select "input#incoming_description", :name => "incoming[description]"
      assert_select "input#incoming_copy_count", :name => "incoming[copy_count]"
      assert_select "input#incoming_copy_no", :name => "incoming[copy_no]"
      assert_select "input#incoming_pages", :name => "incoming[pages]"
      assert_select "input#incoming_serial_no2", :name => "incoming[serial_no2]"
      assert_select "input#incoming_in_out_no", :name => "incoming[in_out_no]"
      assert_select "input#incoming_delo_no", :name => "incoming[delo_no]"
      assert_select "input#incoming_delo_pages", :name => "incoming[delo_pages]"
    end
  end
end
