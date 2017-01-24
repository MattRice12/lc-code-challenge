class CommentsController < ApplicationController
  def index
    comments = Comment.all
    render locals: {
      comments: comments,
      comment: Comment.new
    }
  end

  def create
    comment = Comment.new(comment_params)
    if comment.save
      redirect_to :root
    else
      render "index.html.erb", locals: {
          comments: Comment.all,
          comment: comment
        }
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:text)
  end
end
