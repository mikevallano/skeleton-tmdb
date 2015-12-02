require 'rails_helper'

RSpec.describe "invites/new", type: :view do
  before(:each) do
    assign(:invite, Invite.new(
      :sender_id => 1,
      :receiver_id => 1,
      :token => "MyString",
      :email => "MyString"
    ))
  end

  it "renders new invite form" do
    render

    assert_select "form[action=?][method=?]", invites_path, "post" do

      assert_select "input#invite_sender_id[name=?]", "invite[sender_id]"

      assert_select "input#invite_receiver_id[name=?]", "invite[receiver_id]"

      assert_select "input#invite_token[name=?]", "invite[token]"

      assert_select "input#invite_email[name=?]", "invite[email]"
    end
  end
end
