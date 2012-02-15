require 'spec_helper'

describe "workdays/show.html.haml" do
  before(:each) do
    @workday = assign(:workday, stub_model(Workday,
      :date => "Date",
      :is_workday => false,
      :memo => "Memo"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Date/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/false/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Memo/)
  end
end
