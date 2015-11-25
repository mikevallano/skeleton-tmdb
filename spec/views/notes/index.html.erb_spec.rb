require 'rails_helper'

RSpec.describe "notes/index", type: :view do
  before(:each) do
    assign(:notes, [
      Note.create!(
        :rating => 1,
        :review => "MyText",
        :seen => false,
        :user => nil,
        :movie => nil
      ),
      Note.create!(
        :rating => 1,
        :review => "MyText",
        :seen => false,
        :user => nil,
        :movie => nil
      )
    ])
  end

  it "renders a list of notes" do
    render
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
