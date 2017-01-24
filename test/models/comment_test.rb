require 'test_helper'

class CommentTest < ActiveSupport::TestCase
  test "create comment" do
    new_comment = Comment.create!(text: "New comment")
    assert_equal("New comment", new_comment.text)
  end

  test "strip whitespace method" do
    whitespace_blank = Comment.create(text: "      ")
    whitespace_period = Comment.create(text: "     .     ")
    whitespace_between_periods = Comment.create(text: "     .      .")

    assert_equal("", whitespace_blank.text)
    assert_equal(".", whitespace_period.text)
    assert_equal(".      .", whitespace_between_periods.text)
  end

  test "validations: presence" do
    comment_blank = Comment.create(text: "")
    comment_whitespace = Comment.create(text: "      ")
    comment_present = Comment.create(text: "Presence")

    assert_equal ["can't be blank", "is too short (minimum is 5 characters)"], comment_blank.errors.messages[:text]
    assert_equal ["can't be blank", "is too short (minimum is 5 characters)"], comment_whitespace.errors.messages[:text]
    assert_equal [], comment_present.errors.messages[:text]
  end

  test "validations: minimum character limit" do
    comment_too_short = Comment.create(text: "Hi")
    comment_whitespace_period = Comment.create(text: "     .      ")
    comment_just_right = Comment.create(text: "Howdy")

    assert_equal ["is too short (minimum is 5 characters)"], comment_too_short.errors.messages[:text]
    assert_equal ["is too short (minimum is 5 characters)"], comment_whitespace_period.errors.messages[:text]
    assert_equal [], comment_just_right.errors.messages[:text]
  end

  test "validations: maximum character limit" do
    comment501 = Comment.create(text: ("a" * 501))
    comment500 = Comment.create(text: ("a" * 500))

    assert_equal ["is too long (maximum is 500 characters)"], comment501.errors.messages[:text]
    assert_equal [], comment500.errors.messages[:text]
  end
end
