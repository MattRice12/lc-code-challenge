module VentsHelper
  def submit_time(vent)
    t("time.submitted", count: distance_of_time_in_words(Time.now, vent.created_at))
  end
end
