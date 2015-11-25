require 'rails_helper'

RSpec.describe "taggings/show", type: :view do
  before(:each) do
    @tagging = assign(:tagging, Tagging.create!(
      :tag => nil,
      :movie => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(//)
  end
end
