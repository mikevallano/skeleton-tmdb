require 'rails_helper'

RSpec.describe "notes/edit", type: :view do
  before(:each) do
    @note = assign(:note, Note.create!(
      :rating => 1,
      :review => "MyText",
      :seen => false,
      :user => nil,
      :movie => nil
    ))
  end

  it "renders the edit note form" do
    render

    assert_select "form[action=?][method=?]", note_path(@note), "post" do

      assert_select "input#note_rating[name=?]", "note[rating]"

      assert_select "textarea#note_review[name=?]", "note[review]"

      assert_select "input#note_seen[name=?]", "note[seen]"

      assert_select "input#note_user_id[name=?]", "note[user_id]"

      assert_select "input#note_movie_id[name=?]", "note[movie_id]"
    end
  end
end
