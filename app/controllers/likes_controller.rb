class LikesController < ApplicationController
  def create
    likeable_type = params[:likeable_type]
    @likeable = find_object likeable_type, "likeable_id"
    @like = current_user.likes.build likeable_type: likeable_type.capitalize!, likeable_id: @likeable.id
    if @like.save
      respond_to do |format|
        format.js
      end
    end
    redirect_to :back
  end

  def destroy
    likeable_type = params[:likeable_type]
    likeable_id = params[:likeable_id]
    @like = current_user.likes.where(likeable_type: likeable_type, likeable_id: likeable_id).first
    if @like.destroy
      respond_to do |format|
        format.js
      end
    end
  end
end
