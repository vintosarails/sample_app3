require 'rails_helper'

RSpec.describe "comments/new", type: :view do
  before(:each) do
    assign(:comment, Comment.new(
      :pin_id => 1,
      :body => "MyText",
      :user => nil
    ))
  end

  it "renders new comment form" do
    render

    assert_select "form[action=?][method=?]", comments_path, "post" do

      assert_select "input#comment_pin_id[name=?]", "comment[pin_id]"

      assert_select "textarea#comment_body[name=?]", "comment[body]"

      assert_select "input#comment_user_id[name=?]", "comment[user_id]"
    end
  end
end
