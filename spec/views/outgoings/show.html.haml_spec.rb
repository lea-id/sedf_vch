require 'spec_helper'

describe "outgoings/show" do
  before(:each) do
    @outgoing = assign(:outgoing, stub_model(Outgoing,
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
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    rendered.should match(/2/)
    rendered.should match(/Doc No/)
    rendered.should match(/Address/)
    rendered.should match(/Description/)
    rendered.should match(/3/)
    rendered.should match(/4/)
    rendered.should match(/5/)
    rendered.should match(/Serial No2/)
    rendered.should match(/6/)
    rendered.should match(/7/)
    rendered.should match(/Delo Pages/)
  end
end
