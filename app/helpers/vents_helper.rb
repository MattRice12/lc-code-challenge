module VentsHelper
  def submit_time(vent)
    distance_of_time_in_words(Time.now, vent.created_at)
  end
end
