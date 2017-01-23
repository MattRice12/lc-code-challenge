module CommentsHelper
  def submit_time(comment)
    distance_of_time_in_words(Time.now, comment.created_at)
  end
end
