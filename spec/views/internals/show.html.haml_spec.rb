require 'spec_helper'

describe "internals/show" do
  before(:each) do
    @internal = assign(:internal, stub_model(Internal,
      :title => "Title",
      :description => "Description",
      :attach => "Attach",
      :user => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Title/)
    rendered.should match(/Description/)
    rendered.should match(/Attach/)
    rendered.should match(//)
  end
end
