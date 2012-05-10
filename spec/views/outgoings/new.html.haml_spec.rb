require 'spec_helper'

describe "outgoings/new" do
  before(:each) do
    assign(:outgoing, stub_model(Outgoing,
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

  it "renders new outgoing form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => outgoings_path, :method => "post" do
      assert_select "input#outgoing_user_id", :name => "outgoing[user_id]"
      assert_select "input#outgoing_serial_no1", :name => "outgoing[serial_no1]"
      assert_select "input#outgoing_doc_no", :name => "outgoing[doc_no]"
      assert_select "input#outgoing_address", :name => "outgoing[address]"
      assert_select "input#outgoing_description", :name => "outgoing[description]"
      assert_select "input#outgoing_copy_count", :name => "outgoing[copy_count]"
      assert_select "input#outgoing_copy_no", :name => "outgoing[copy_no]"
      assert_select "input#outgoing_pages", :name => "outgoing[pages]"
      assert_select "input#outgoing_serial_no2", :name => "outgoing[serial_no2]"
      assert_select "input#outgoing_in_out_no", :name => "outgoing[in_out_no]"
      assert_select "input#outgoing_delo_no", :name => "outgoing[delo_no]"
      assert_select "input#outgoing_delo_pages", :name => "outgoing[delo_pages]"
    end
  end
end
