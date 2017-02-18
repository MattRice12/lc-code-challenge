module VentsHelper
  def submit_time(vent)
    t("datetime.distance_in_words.submitted", count: distance_of_time_in_words(Time.now, vent.created_at))
  end
end
