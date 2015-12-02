require 'rails_helper'

RSpec.describe "invites/show", type: :view do
  before(:each) do
    @invite = assign(:invite, Invite.create!(
      :sender_id => 1,
      :receiver_id => 2,
      :token => "Token",
      :email => "Email"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/1/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/Token/)
    expect(rendered).to match(/Email/)
  end
end
