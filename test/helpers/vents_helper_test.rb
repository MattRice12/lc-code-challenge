class VentsHelperTest < ActionView::TestCase
  test "should return submitted time" do
    vent = Vent.create(text: "Hi there", created_at: Time.now)
    vent_minute = Vent.create(text: "Bye now", created_at: (Time.now - 1.minute))
    vent_hour = Vent.create(text: "Bye a while ago", created_at: (Time.now - 1.hour))

    assert_dom_equal "less than a minute", submit_time(vent)
    assert_dom_equal "1 minute", submit_time(vent_minute)
    assert_dom_equal "about 1 hour", submit_time(vent_hour)
  end
end
