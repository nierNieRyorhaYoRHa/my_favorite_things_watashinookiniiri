class CommentsController < ApplicationController

  def create
    @comment = Comment.new(text: params[:comment][:text], user_id: current_user.id, thing_id: params[:thing_id])
    ActionCable.server.broadcast 'comment_channel', content: @comment if @comment.save
  end

end
