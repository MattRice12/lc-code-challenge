class CommentsHelperTest < ActionView::TestCase
  test "should return submitted time" do
    comment = Comment.create(text: "Hi there", created_at: Time.now)
    comment_minute = Comment.create(text: "Bye now", created_at: (Time.now - 1.minute))
    comment_hour = Comment.create(text: "Bye a while ago", created_at: (Time.now - 1.hour))

    assert_dom_equal "less than a minute", submit_time(comment)
    assert_dom_equal "1 minute", submit_time(comment_minute)
    assert_dom_equal "about 1 hour", submit_time(comment_hour)
  end
end
