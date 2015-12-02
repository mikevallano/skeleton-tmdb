require 'rails_helper'

RSpec.describe "invites/index", type: :view do
  before(:each) do
    assign(:invites, [
      Invite.create!(
        :sender_id => 1,
        :receiver_id => 2,
        :token => "Token",
        :email => "Email"
      ),
      Invite.create!(
        :sender_id => 1,
        :receiver_id => 2,
        :token => "Token",
        :email => "Email"
      )
    ])
  end

  it "renders a list of invites" do
    render
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => "Token".to_s, :count => 2
    assert_select "tr>td", :text => "Email".to_s, :count => 2
  end
end
