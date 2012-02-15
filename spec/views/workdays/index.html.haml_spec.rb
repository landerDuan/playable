require 'spec_helper'

describe "workdays/index.html.haml" do
  before(:each) do
    assign(:workdays, [
      stub_model(Workday,
        :date => "Date",
        :is_workday => false,
        :memo => "Memo"
      ),
      stub_model(Workday,
        :date => "Date",
        :is_workday => false,
        :memo => "Memo"
      )
    ])
  end

  it "renders a list of workdays" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Date".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => false.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Memo".to_s, :count => 2
  end
end
