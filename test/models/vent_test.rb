require 'test_helper'

class VentTest < ActiveSupport::TestCase
  test "create vent" do
    new_vent = Vent.create!(text: "New vent")
    assert_equal("New vent", new_vent.text)
  end

  test "strip whitespace method" do
    whitespace_blank = Vent.create(text: "      ")
    whitespace_period = Vent.create(text: "     .     ")
    whitespace_between_periods = Vent.create(text: "     .      .")

    assert_equal("", whitespace_blank.text)
    assert_equal(".", whitespace_period.text)
    assert_equal(".      .", whitespace_between_periods.text)
  end

  test "validations: presence" do
    vent_blank = Vent.create(text: "")
    vent_whitespace = Vent.create(text: "      ")
    vent_present = Vent.create(text: "Presence")

    assert_equal ["can't be blank", "is too short (minimum is 5 characters)"], vent_blank.errors.messages[:text]
    assert_equal ["can't be blank", "is too short (minimum is 5 characters)"], vent_whitespace.errors.messages[:text]
    assert_equal [], vent_present.errors.messages[:text]
  end

  test "validations: minimum character limit" do
    vent_too_short = Vent.create(text: "Hi")
    vent_whitespace_period = Vent.create(text: "     .      ")
    vent_just_right = Vent.create(text: "Howdy")

    assert_equal ["is too short (minimum is 5 characters)"], vent_too_short.errors.messages[:text]
    assert_equal ["is too short (minimum is 5 characters)"], vent_whitespace_period.errors.messages[:text]
    assert_equal [], vent_just_right.errors.messages[:text]
  end

  test "validations: maximum character limit" do
    vent501 = Vent.create(text: ("a" * 501))
    vent500 = Vent.create(text: ("a" * 500))

    assert_equal ["is too long (maximum is 500 characters)"], vent501.errors.messages[:text]
    assert_equal [], vent500.errors.messages[:text]
  end
end
