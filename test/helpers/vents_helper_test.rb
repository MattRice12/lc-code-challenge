class VentsHelperTest < ActionView::TestCase
  test "should return submitted time" do
    vent = Vent.create(text: "Hi there", created_at: Time.now)
    vent_minute = Vent.create(text: "Bye now", created_at: (Time.now - 1.minute))
    vent_hour = Vent.create(text: "Bye a while ago", created_at: (Time.now - 1.hour))

    assert_dom_equal "Submitted less than a minute ago.", submit_time(vent)
    assert_dom_equal "Submitted 1 minute ago.", submit_time(vent_minute)
    assert_dom_equal "Submitted about 1 hour ago.", submit_time(vent_hour)
  end
end
