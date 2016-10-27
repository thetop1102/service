class CommentsController < ApplicationController
  def create
    @comment = current_user.comments.build comment_params
    @commentable = find_commentable
    @commentable.comments << @comment
    if @comment.save
      respond_to do |format|
        format.js
      end
    else
      flash[:danger] = "Fail"
    end
  end

  def destroy
    #do destroy
  end

  private
  def comment_params
    params.require(:comment).permit :content
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
