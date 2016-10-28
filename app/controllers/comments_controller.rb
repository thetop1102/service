class CommentsController < ApplicationController
  def create
    @comment = current_user.comments.build comment_params
    @commentable = find_commentable
    @commentable.comments << @comment
    unless @comment.commentable.user_id == current_user.id
      @activity = @comment.activities.new tag_user_id: @comment.commentable.user_id,
        user_id: current_user.id
    end
    if @comment.save
      respond_to do |format|
        format.js
      end
    else
      flash[:danger] = "Fail"
    end
  end

  private
  def comment_params
    params.require(:comment).permit :content, :parent_id
  end

  def find_commentable
    params.each do |name, value|
      if name =~ /(.+)_id$/
        return $1.classify.constantize.find(value)
      end
    end
    nil
  end
end
