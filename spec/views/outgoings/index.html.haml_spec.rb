require 'spec_helper'

describe "outgoings/index" do
  before(:each) do
    assign(:outgoings, [
      stub_model(Outgoing,
        :user_id => 1,
        :serial_no1 => 2,
        :doc_no => "Doc No",
        :address => "Address",
        :description => "Description",
        :copy_count => 3,
        :copy_no => 4,
        :pages => 5,
        :serial_no2 => "Serial No2",
        :in_out_no => 6,
        :delo_no => 7,
        :delo_pages => "Delo Pages"
      ),
      stub_model(Outgoing,
        :user_id => 1,
        :serial_no1 => 2,
        :doc_no => "Doc No",
        :address => "Address",
        :description => "Description",
        :copy_count => 3,
        :copy_no => 4,
        :pages => 5,
        :serial_no2 => "Serial No2",
        :in_out_no => 6,
        :delo_no => 7,
        :delo_pages => "Delo Pages"
      )
    ])
  end

  it "renders a list of outgoings" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => "Doc No".to_s, :count => 2
    assert_select "tr>td", :text => "Address".to_s, :count => 2
    assert_select "tr>td", :text => "Description".to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
    assert_select "tr>td", :text => 4.to_s, :count => 2
    assert_select "tr>td", :text => 5.to_s, :count => 2
    assert_select "tr>td", :text => "Serial No2".to_s, :count => 2
    assert_select "tr>td", :text => 6.to_s, :count => 2
    assert_select "tr>td", :text => 7.to_s, :count => 2
    assert_select "tr>td", :text => "Delo Pages".to_s, :count => 2
  end
end
