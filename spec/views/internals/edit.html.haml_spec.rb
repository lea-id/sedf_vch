require 'spec_helper'

describe "internals/edit" do
  before(:each) do
    @internal = assign(:internal, stub_model(Internal,
      :title => "MyString",
      :description => "MyString",
      :attach => "MyString",
      :user => nil
    ))
  end

  it "renders the edit internal form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => internals_path(@internal), :method => "post" do
      assert_select "input#internal_title", :name => "internal[title]"
      assert_select "input#internal_description", :name => "internal[description]"
      assert_select "input#internal_attach", :name => "internal[attach]"
      assert_select "input#internal_user", :name => "internal[user]"
    end
  end
end
